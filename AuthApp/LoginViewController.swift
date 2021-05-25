//
//  LoginViewController.swift
//  AuthApp
//
//  Created by SERGEY VOROBEV on 25.05.2021.
//

import UIKit

struct User {
    let username: String
    let password: String
}

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    // MARK: - Properties
    private var user = User(username: "User", password: "Password")
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameInput.returnKeyType = .next
        usernameInput.delegate = self
        
        passwordInput.returnKeyType = .done
        passwordInput.enablesReturnKeyAutomatically = true
        passwordInput.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        if usernameInput.text != user.username || passwordInput.text != user.password {
            showAlert(title: "Error", message: "User not found :(")
            
            return
        }
        
        welcomeVC.user = user
    }
    
    // MARK: - Events Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
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
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(okButton)
        
        present(alert, animated: true)
    }
}

// MARK: - Extensions
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameInput {
            passwordInput.becomeFirstResponder()
        }
        
        if textField == passwordInput {
            performSegue(withIdentifier: "welcomeVCSegue", sender: self)
        }
        
        return true
    }
}
