//
//  LoginViewController.swift
//  AuthApp
//
//  Created by SERGEY VOROBEV on 25.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Properties
    private let user = User(username: "User", password: "Password", photo: UIImage(named: "photo")!, fullName: "Сергей Воробьев", age: 33, city: "Новосибирск", information: "👋 У меня, как и у большинства людей, есть несколько увлечений.\n\nО некоторых я расскажу в этом разделе:\n\n🚴‍♂️ Езда на велосипеде\n\nЛюблю на выходных или после работы покататься на велосипеде. Мой минимум - 12 км. за 1 час. Обычно я катаюсь полтора-два часа\n\n🚶‍♂️Прогулки на свежем воздухе\n\nВ теплую погоду люблю гулять по городу, ходить в парк. Очень нравится отдыхать на берегу реки или озера\n\n🪐 Космос\n\nКосмос захватывает умы людей своей неизведанностью. Уже в далекой древности люди с восхищением смотрели в звёздное небо, но даже сегодня  для человечества космос остается самой большой загадкой")
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureKeyboard()
        configureButtons()
        configureTextFields()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        if usernameInput.text != user.username || passwordInput.text != user.password {
            showAlert(title: "Error", message: "User not found 😢")
            
            return
        }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutVC = navigationVC.topViewController as! AboutViewController
                
                aboutVC.user = user
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func unwindToLoginController(_ unwindSegue: UIStoryboardSegue) {
        guard let _ = unwindSegue.source as? WelcomeViewController else { return }
        
        usernameInput.text = ""
        passwordInput.text = ""
    }
    
    @IBAction func forgotUsernameButton() {
        showAlert(title: "Oops!", message: "Your name is \(user.username)")
    }
    
    @IBAction func forgotPaswordButton() {
        showAlert(title: "Oops!", message: "Your password is \(user.password)")
    }
    
    // MARK: - Methods
    private func configureKeyboard() {
        usernameInput.returnKeyType = .next
        usernameInput.delegate = self
        
        passwordInput.returnKeyType = .done
        passwordInput.enablesReturnKeyAutomatically = true
        passwordInput.delegate = self
    }
    
    private func configureButtons() {
        loginButton.backgroundColor = UIColor(named: "loginButtonNormal")
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitleColor(UIColor(named: "buttonTextHighlighted"), for: .highlighted)
    }
    
    private func configureTextFields() {
        let textFields = [usernameInput, passwordInput]
        
        textFields.forEach { textField in
            if let textField = textField {
                let bottomBorder = UIView()
                
                bottomBorder.backgroundColor = .systemGray5
                
                textField.textColor = .systemGray
                textField.borderStyle = .none
                textField.addSubview(bottomBorder)
                
                bottomBorder.translatesAutoresizingMaskIntoConstraints = false
                
                // add constraints for bottom line
                bottomBorder.bottomAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
                bottomBorder.leftAnchor.constraint(equalTo: textField.leftAnchor).isActive = true
                bottomBorder.rightAnchor.constraint(equalTo: textField.rightAnchor).isActive = true
                bottomBorder.heightAnchor.constraint(equalToConstant: 2).isActive = true

            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(okButton)
        
        // hide keyboard if visible
        view.endEditing(true)
        
        present(alert, animated: true)
    }
}

// MARK: - Extension
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameInput:
            passwordInput.becomeFirstResponder()
        case passwordInput:
            performSegue(withIdentifier: "welcomeVCSegue", sender: self)
        default:
            break
        }

        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
}
