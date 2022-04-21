//
//  ColoredLabelsView.swift
//  LearningApp
//
//  Created by Дарья Селезнёва on 15.04.2022.
//

import UIKit

class ColoredLabelsView: UIView {
    
    private let stackView = UIStackView()
    private let lessonsQuantityLabel = ColoredLabel()
    private let themeLabel = ColoredLabel()
    private let costLabel = ColoredLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.pinToEdges(subview: stackView)
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.addArrangedSubview(lessonsQuantityLabel)
        stackView.addArrangedSubview(themeLabel)
        stackView.addArrangedSubview(costLabel)
        lessonsQuantityLabel.backgroundColor = .appMint
        themeLabel.backgroundColor = .appBlue
        costLabel.backgroundColor = .appPurple
    }
    
    func update(lessonsQuantity: String, theme: String, cost: String) {
        lessonsQuantityLabel.text = lessonsQuantity
        themeLabel.text = theme
        costLabel.text = cost
    }
}
