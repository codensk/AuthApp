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
    
    @IBOutlet weak var logoutButton: UIButton!
    
    // MARK: - Properties
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        showUserInfo()
    }
    
    // MARK: - Methods
    private func showUserInfo() {
        guard let user = user else { return }
        
        welcomeTitleLabel.text = "Welcome, \(user.username)!"
    }
    
    private func configure() {
        view.setGradientBackground(colorTop: UIColor(named: "gradientStart")!, colorBottom: UIColor(named: "gradientFinish")!)
        
        logoutButton.backgroundColor = UIColor(named: "loginButtonNormal")
        logoutButton.layer.cornerRadius = logoutButton.frame.height / 2
        
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.setTitleColor(UIColor(named: "buttonTextHighlighted"), for: .highlighted)
    }
    
}
