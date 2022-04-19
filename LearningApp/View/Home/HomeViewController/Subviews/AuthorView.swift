//
//  AuthorView.swift
//  LearningApp
//
//  Created by Daria on 14.04.2022.
//

import UIKit

class AuthorView: UIView {
    
    var nameColor: UIColor? = UIColor.white {
        didSet {
            nameLabel.textColor = nameColor
        }
    }
    
    private let horizontalStackView = UIStackView()
    private let verticalStackView = UIStackView()
    
    private let imageContainerView = UIView()
    private let imageView = UIImageView()
    private let nameLabel = UILabel.make(fontName: poppinsSemiBold, size: 16, textColor: .white)
    private let positionLabel = UILabel.make(fontName: poppinsMedium, size: 10, textColor: .appGray)
    private let onlineIndicator = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.pinToEdges(subview: horizontalStackView)
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 20
        horizontalStackView.alignment = .center
        horizontalStackView.contentMode = .left
        horizontalStackView.addArrangedSubview(imageContainerView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 2
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(positionLabel)
        imageContainerView.pinToEdges(subview: imageView)
        imageContainerView.setDimensions(width: 40, height: 40)
        imageContainerView.pinToEdges(subview: onlineIndicator, leading: nil, top: nil)
        onlineIndicator.setDimensions(width: 10, height: 10)
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        onlineIndicator.layer.cornerRadius = 5
        onlineIndicator.layer.borderColor = UIColor.white.cgColor
        onlineIndicator.layer.borderWidth = 1
        onlineIndicator.backgroundColor = .appGreen
    }
    
    func update(image: UIImage, name: String, position: String, isOnline: Bool) {
        imageView.image = image
        nameLabel.text = name
        positionLabel.text = position
        onlineIndicator.isHidden = !isOnline
    }
}
