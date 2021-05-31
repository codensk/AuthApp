//
//  HobbyViewController.swift
//  AuthApp
//
//  Created by SERGEY VOROBEV on 28.05.2021.
//

import UIKit

class HobbyViewController: UIViewController {
    @IBOutlet weak var informationTextView: UITextView!
    
    // MARK: - Properties
    var user: User?
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureTextField()
    }
    
    // MARK: - Methods
    private func configureView() {
        view.setGradientBackground(colorTop: UIColor(named: "categoryGradientStart")!, colorBottom: UIColor(named: "categoryGradientFinish")!)
                
        title = "My hobbies"
    }
    
    private func configureTextField() {
        if let user = user {
            informationTextView.text = user.information
        }
    }

}
