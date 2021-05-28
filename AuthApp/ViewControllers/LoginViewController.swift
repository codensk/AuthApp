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
    private let user = User(username: "User", password: "Password")
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureKeyboard()
        configureButtons()
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
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(okButton)
        
        // hide keyboard if visible
        view.endEditing(true)
        
        present(alert, animated: true)
    }
}
