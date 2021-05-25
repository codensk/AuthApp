//
//  WelcomeViewController.swift
//  AuthApp
//
//  Created by SERGEY VOROBEV on 25.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var welcomeTitleLabel: UILabel!
    @IBOutlet weak var welcomeImageView: UIImageView!
    
    // MARK: - Properties
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showUserInfo()
    }
    
    // MARK: - Methods
    private func showUserInfo() {
        guard let user = user else { return }
        
        welcomeTitleLabel.text = "Welcome, \(user.username)!"
    }
    

}
