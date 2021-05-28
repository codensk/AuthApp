//
//  CarrierViewController.swift
//  AuthApp
//
//  Created by SERGEY VOROBEV on 28.05.2021.
//

import UIKit

class CarrierViewController: UIViewController {
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    
    // MARK: - IBActions
    @IBAction func changeLifeProgress(_ sender: UISlider) {
        let currentValue = Int(sender.value) - 1
        
        changeStepDescription(for: currentValue)
    }
  
    // MARK: - Methods
    private func configureViewController() {
        view.setGradientBackground(colorTop: UIColor(named: "categoryGradientStart")!, colorBottom: UIColor(named: "categoryGradientFinish")!)
                
        title = "My profession"
        
        changeStepDescription(for: 0)
    }
    
    private func changeStepDescription(for step: Int) {
        let steps = Progress.getProgressSteps()
        let currentStep = steps[step]
        
        progressLabel.textColor = currentStep.textColor
        progressLabel.text = currentStep.text
        
        periodLabel.textColor = .systemGray
        periodLabel.text = currentStep.period
    }
}
