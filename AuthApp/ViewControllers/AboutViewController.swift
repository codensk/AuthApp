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
    
    // MARK: - Properties
    var user: User?
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureButtons()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let user = user else { return }
        
        switch segue.destination {
        case let photoVC as PhotoViewController:
            photoVC.user = user
        case let hobbyVC as HobbyViewController:
            hobbyVC.user = user
        default:
            break
        }
    }
    
    // MARK: - Methods
    private func configureView() {
        view.setGradientBackground(colorTop: UIColor(named: "aboutGradientStart")!, colorBottom: UIColor(named: "aboutGradientFinish")!)
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
