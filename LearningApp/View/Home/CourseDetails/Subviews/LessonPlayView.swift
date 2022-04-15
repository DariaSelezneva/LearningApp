//
//  LessonPlayView.swift
//  LearningApp
//
//  Created by Дарья Селезнёва on 15.04.2022.
//

import UIKit

class LessonPlayView: UIView {
    
    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.type = .conic
        l.colors = [UIColor.appRed!.cgColor, UIColor.white.cgColor, UIColor.appRed!.cgColor]
        l.locations = [0.0, 0.45, 1]
        l.startPoint = CGPoint(x: 0.5, y: 0.5)
        l.endPoint = CGPoint(x: 0.5, y: 0)
        l.cornerRadius = 10
        layer.insertSublayer(l, at: 0)
        return l
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setDimensions(width: 15, height: 22)
        imageView.image = UIImage(systemName: "play.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.alignToCenter(subview: imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
