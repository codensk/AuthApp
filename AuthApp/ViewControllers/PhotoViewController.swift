//
//  PhotoViewController.swift
//  AuthApp
//
//  Created by SERGEY VOROBEV on 28.05.2021.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var containerPhotoView: UIView!
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    // MARK: - Properties
    var user: User?
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configurePhotoView()
        configureLabels()
    }
    
    // MARK: - Methods
    private func configureView() {
        view.setGradientBackground(colorTop: UIColor(named: "categoryGradientStart")!, colorBottom: UIColor(named: "categoryGradientFinish")!)
        
        title = "About me"
    }
    
    private func configurePhotoView() {
        containerPhotoView.layer.cornerRadius = containerPhotoView.frame.height / 2
        containerPhotoView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        containerPhotoView.layer.shadowOpacity = 0.7
        containerPhotoView.layer.shadowRadius = 7.0
        containerPhotoView.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        photoView.layer.cornerRadius = photoView.frame.height / 2
        photoView.clipsToBounds = true
        
        if let user = user {
            photoView.image = user.photo
        }
    }
    
    private func configureLabels() {
        if let user = user {
            nameLabel.text = "\(user.fullName), \(user.age)"
            cityLabel.text = user.city
        }
    }
}
