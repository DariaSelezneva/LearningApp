//
//  FollowButton.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import UIKit

class FollowButton: UIButton {
    
    var text: String = "" {
        didSet {
            label.text = text
        }
    }
    
    var triangleHeight: CGFloat = 8
    var triangleXPosition: CGFloat = 30
    
    let label = UILabel.make(fontName: poppinsMedium, size: 16, textColor: .white)
    
    override func draw(_ rect: CGRect) {
        let baseRect = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - triangleHeight)
        let basePath = UIBezierPath(roundedRect: baseRect, cornerRadius: 8)
        UIColor.appRed?.set()
        basePath.fill()
        let additionalPath = UIBezierPath()
        additionalPath.move(to: CGPoint(x: triangleXPosition, y: self.bounds.maxY))
        additionalPath.addLine(to: CGPoint(x: triangleXPosition, y: self.bounds.maxY - triangleHeight - 1))
        additionalPath.addLine(to: CGPoint(x: triangleXPosition + triangleHeight * 1.8, y: self.bounds.maxY - triangleHeight - 1))
        additionalPath.close()
        additionalPath.fill()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -triangleHeight / 2).isActive = true
    }
}
