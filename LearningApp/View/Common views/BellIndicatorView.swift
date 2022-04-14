//
//  BellIndicatorView.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import UIKit

class BellIndicatorView: UIView {
    
    private let bellImageView = UIImageView(image: UIImage(systemName: "bell.fill"))
    private let indicatorView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        bellImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bellImageView)
        bellImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        bellImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bellImageView.setDimensions(width: 20, height: 20)
        bellImageView.contentMode = .scaleAspectFit
        bellImageView.tintColor = .black
        bellImageView.pinToEdges(subview: indicatorView, leading: nil, trailing: 0, top: 0, bottom: nil)
        indicatorView.setDimensions(width: 8, height: 8)
        indicatorView.layer.cornerRadius = 4
        indicatorView.layer.borderWidth = 1
        indicatorView.layer.borderColor = UIColor.white.cgColor
        indicatorView.backgroundColor = .appRed
    }
    
    func update(showsIndicator: Bool) {
        indicatorView.isHidden = !showsIndicator
    }
}
