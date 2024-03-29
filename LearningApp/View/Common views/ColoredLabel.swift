//
//  ColoredLabel.swift
//  LearningApp
//
//  Created by Daria on 14.04.2022.
//

import UIKit

class ColoredLabel: UIView {
    
    var text: String? {
        didSet {
            label.text = text
        }
    }
    var textColor: UIColor? = .white {
        didSet {
            label.textColor = textColor
        }
    }
    
    var font: UIFont? = UIFont(name: poppinsMedium, size: 10) {
        didSet {
            label.font = font
        }
    }
    
    var textInsets: UIEdgeInsets = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4) {
        didSet {
            label.removeFromSuperview()
            self.pinToEdges(subview: label, leading: textInsets.left, trailing: textInsets.right, top: textInsets.top, bottom: textInsets.bottom)
        }
    }
    
    static func makeForExtras() -> ColoredLabel {
        let extrasLabel = ColoredLabel()
        extrasLabel.textInsets = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
        extrasLabel.backgroundColor = .appYellow
        extrasLabel.layer.cornerRadius = 10
        extrasLabel.textColor = .white
        extrasLabel.font = UIFont(name: poppinsMedium, size: 10)
        return extrasLabel
    }
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.pinToEdges(subview: label, leading: textInsets.left, trailing: textInsets.right, top: textInsets.top, bottom: textInsets.bottom)
        layer.cornerRadius = 4
        label.font = font
        label.textColor = textColor
    }
}
