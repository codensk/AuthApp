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
        
        showUserInfo()
        configureButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setGradientBackground(colorTop: UIColor(named: "gradientStart")!, colorBottom: UIColor(named: "gradientFinish")!)
    }
    
    // MARK: - Methods
    private func showUserInfo() {
        guard let user = user else { return }
        
        welcomeTitleLabel.text = "Welcome, \(user.username)!"
    }
    
    private func configureButtons() {
        logoutButton.backgroundColor = UIColor(named: "loginButtonNormal")
        logoutButton.layer.cornerRadius = logoutButton.frame.height / 2
        
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.setTitleColor(UIColor(named: "buttonTextHighlighted"), for: .highlighted)
    }
    
    private func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
