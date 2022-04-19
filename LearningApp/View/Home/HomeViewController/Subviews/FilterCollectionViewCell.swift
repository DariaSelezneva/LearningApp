//
//  FilterCollectionViewCell.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    let label = UILabel()
    
    static let reuseIdentifier = "filterCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup() {
        contentView.layer.cornerRadius = 8
        contentView.alignToCenter(subview: label)
        label.font = UIFont(name: poppinsMedium, size: 14)
    }
    
    func update(text: String, isSelected: Bool) {
        contentView.backgroundColor = isSelected ? .appRed : .appLightGray2
        label.textColor = isSelected ? .white : .appGray
        label.text = text
    }
}
