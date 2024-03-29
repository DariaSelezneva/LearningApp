//
//  GradientView.swift
//  LearningApp
//
//  Created by Daria on 14.04.2022.
//

import UIKit

class GradientView: UIView {
    
    override init(frame: CGRect) {
        gradientLayer = CAGradientLayer()
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    convenience init(colors: [UIColor]) {
        self.init(frame: .zero)
        gradientLayer = makeGradient(colors: colors)
    }
    
    private var gradientLayer: CAGradientLayer
    
    func makeGradient(colors: [UIColor]) -> CAGradientLayer {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = colors.map({$0.cgColor})
        l.locations = [0.0, 0.5, 1.0]
        l.startPoint = CGPoint(x: 0.5, y: 0)
        l.endPoint = CGPoint(x: 0.5, y: 1)
        l.cornerRadius = 24
        layer.insertSublayer(l, at: 0)
        return l
    }
    
//    private lazy var gradientLayer: CAGradientLayer = {
//        let l = CAGradientLayer()
//        l.frame = self.bounds
//        l.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor]
//        l.locations = [0.0, 0.5, 1.0]
//        l.startPoint = CGPoint(x: 0.5, y: 0)
//        l.endPoint = CGPoint(x: 0.5, y: 1)
//        l.cornerRadius = 24
//        layer.insertSublayer(l, at: 0)
//        return l
//    }()
}
