//
//  LoginViewController+UITextFieldDelegate.swift
//  AuthApp
//
//  Created by SERGEY VOROBEV on 28.05.2021.
//

import Foundation
import UIKit

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
