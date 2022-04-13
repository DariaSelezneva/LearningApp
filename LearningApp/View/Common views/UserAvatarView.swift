//
//  UserAvatarView.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import UIKit

class UserAvatarView: UIView {
    
    private let avatarImageView = UIImageView()
    private let indicatorView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.pinToEdges(subview: avatarImageView)
        avatarImageView.layer.cornerRadius = 20
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        self.pinToEdges(subview: indicatorView, leading: nil, trailing: 0, top: nil, bottom: 0)
        indicatorView.setDimensions(width: 10, height: 10)
        indicatorView.layer.cornerRadius = 5
        indicatorView.layer.borderWidth = 1
        indicatorView.layer.borderColor = UIColor.white.cgColor
        indicatorView.backgroundColor = .appGreen
    }
    
    func update(image: UIImage, isOnline: Bool) {
        avatarImageView.image = image
        indicatorView.isHidden = !isOnline
    }
}
