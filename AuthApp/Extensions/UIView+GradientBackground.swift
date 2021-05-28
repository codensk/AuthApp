//
//  UIView+GradientBackground.swift
//  AuthApp
//
//  Created by SERGEY VOROBEV on 28.05.2021.
//

import Foundation
import UIKit

extension UIView {
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
