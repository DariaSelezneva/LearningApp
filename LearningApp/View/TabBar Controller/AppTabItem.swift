//
//  AppTabItem.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import UIKit

class AppTabItem: UIButton {
    
    var isActive: Bool = false {
        didSet {
            iconImageView.image = isActive ? selectedImage : deselectedImage
            iconImageView.tintColor = isActive ? .appRed : .appTabGray
            indicatorView.backgroundColor = isActive ? .appRed : .clear
        }
    }
    
    var badgeValue: String? {
        didSet {
            if let value = badgeValue {
                badgeView.isHidden = false
                badgeLabel.text = String(value)
            }
            else {
                badgeView.isHidden = true
            }
        }
    }
    
    private let iconImageView = UIImageView()
    private let indicatorView = UIView()
    
    private var selectedImage: UIImage?
    private var deselectedImage: UIImage?
    
    private let badgeView = UIView()
    private let badgeLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(selectedImageName: String, deselectedImageName: String) {
        self.init(frame: .zero)
        self.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysTemplate)
        self.deselectedImage = UIImage(named: deselectedImageName)?.withRenderingMode(.alwaysTemplate)
        initialSetup()
    }
    
    private func initialSetup() {
        self.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -6).isActive = true
        iconImageView.setDimensions(width: 20, height: 20)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = deselectedImage
        iconImageView.isUserInteractionEnabled = false
        iconImageView.tintColor = .appTabGray
        self.addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicatorView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 10).isActive = true
        indicatorView.setDimensions(width: 12, height: 4)
        indicatorView.layer.cornerRadius = 2
        indicatorView.isUserInteractionEnabled = false
        self.addSubview(badgeView)
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        badgeView.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: -7).isActive = true
        badgeView.trailingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 7).isActive = true
        badgeView.setDimensions(width: 16, height: 16)
        badgeView.backgroundColor = .appRed
        badgeView.layer.cornerRadius = 8
        badgeView.layer.borderWidth = 2
        badgeView.layer.borderColor = UIColor.white.cgColor
        badgeView.alignToCenter(subview: badgeLabel)
        badgeLabel.textColor = .white
        badgeLabel.font = UIFont(name: poppinsMedium, size: 10)
        badgeView.isHidden = true
    }
}
