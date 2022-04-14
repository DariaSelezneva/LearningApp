//
//  PaginationIndicatorView.swift
//  LearningApp
//
//  Created by Daria on 14.04.2022.
//

import UIKit

class PaginationIndicatorView: UIView {
    
    var indexSelected: Int = 0 {
        didSet {
            switch indexSelected {
            case 0: indexSelected = 0
            case totalCount - 1: indexSelected = 2
            default: indexSelected = 1
            }
            updateIndicators()
        }
    }
    
    var totalCount: Int = 0 {
        didSet {
            updateIndicators()
        }
    }
    
    private let stackView = UIStackView()
    
    private let first = UIView()
    private let second = UIView()
    private let third = UIView()
    
    private lazy var indicators = [first, second, third]

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.alignToCenter(subview: stackView)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.contentMode = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 6
        for indicator in indicators {
            stackView.addArrangedSubview(indicator)
            indicator.setDimensions(width: 16, height: 6)
            indicator.layer.cornerRadius = 3
        }
        updateIndicators()
    }
    
    private func updateIndicators() {
        for (index, indicator) in indicators.enumerated() {
            indicator.backgroundColor = index == indexSelected ? .appRed : .appLightGray
        }
    }
}
