//
//  AuthorView.swift
//  LearningApp
//
//  Created by Daria on 14.04.2022.
//

import UIKit

class AuthorView: UIView {
    
    private let horizontalStackView = UIStackView()
    private let verticalStackView = UIStackView()
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let positionLabel = UILabel()

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
        horizontalStackView.addArrangedSubview(imageView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 4
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(positionLabel)
        imageView.setDimensions(width: 40, height: 40)
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        nameLabel.font = UIFont(name: poppinsSemiBold, size: 16)
        nameLabel.textColor = .white
        positionLabel.font = UIFont(name: poppinsMedium, size: 10)
        positionLabel.textColor = .appGray
    }
    
    func update(image: UIImage, name: String, position: String) {
        imageView.image = image
        nameLabel.text = name
        positionLabel.text = position
    }
}
