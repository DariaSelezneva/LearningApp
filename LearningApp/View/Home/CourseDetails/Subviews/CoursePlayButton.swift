//
//  CoursePlayButton.swift
//  LearningApp
//
//  Created by Daria on 19.04.2022.
//

import UIKit

class CoursePlayButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup() {
        self.setDimensions(width: 72, height: 72)
        let transparentView = UIView()
        self.pinToEdges(subview: transparentView)
        transparentView.layer.cornerRadius = 36
        transparentView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        transparentView.isUserInteractionEnabled = false
        let config = UIImage.SymbolConfiguration(pointSize: 54, weight: .regular, scale: .default)
        self.setImage(UIImage(systemName: "play.circle.fill", withConfiguration: config), for: .normal)
        self.tintColor = .white
    }
}
