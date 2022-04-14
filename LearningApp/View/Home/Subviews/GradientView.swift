//
//  GradientView.swift
//  LearningApp
//
//  Created by Daria on 14.04.2022.
//

import UIKit

class GradientView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        l.startPoint = CGPoint(x: 0.5, y: 0.2)
        l.endPoint = CGPoint(x: 0.5, y: 1)
        l.cornerRadius = 24
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
