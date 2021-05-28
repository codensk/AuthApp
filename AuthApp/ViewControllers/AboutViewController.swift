//
//  AboutViewController.swift
//  AuthApp
//
//  Created by SERGEY VOROBEV on 28.05.2021.
//

import UIKit

class AboutViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var hobbiesButton: UIButton!
    @IBOutlet weak var carrierButton: UIButton!
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureButtons()
    }
    
    // MARK: - Methods
    private func configureViewController() {
        view.setGradientBackground(colorTop: UIColor(named: "aboutGradientStart")!, colorBottom: UIColor(named: "aboutGradientFinish")!)
        
        title = "About me"
    }
    
    private func configureButtons() {
        let buttons = [aboutButton, hobbiesButton, carrierButton]
        
        buttons.forEach { button in
            button?.setTitleColor(.white, for: .normal)
            button?.backgroundColor = UIColor(named: "aboutButtonNormal")
            button?.layer.cornerRadius = button!.frame.height / 2
        }
    }
}
