//
//  HobbyViewController.swift
//  AuthApp
//
//  Created by SERGEY VOROBEV on 28.05.2021.
//

import UIKit

class HobbyViewController: UIViewController {    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    
    // MARK: - Methods
    private func configureViewController() {
        view.setGradientBackground(colorTop: UIColor(named: "categoryGradientStart")!, colorBottom: UIColor(named: "categoryGradientFinish")!)
                
        title = "My hobbies"
    }

}
