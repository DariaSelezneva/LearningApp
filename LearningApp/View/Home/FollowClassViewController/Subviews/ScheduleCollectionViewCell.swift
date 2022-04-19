//
//  ScheduleCollectionViewCell.swift
//  LearningApp
//
//  Created by Daria on 19.04.2022.
//

import UIKit

class ScheduleCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "scheduleCell"
    
    private let containerView = UIView()
    private let label = UILabel.make(fontName: poppinsMedium, size: 14, textColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 2
        contentView.pinToEdges(subview: containerView, leading: 4, trailing: 4, top: 4, bottom: 4)
        containerView.layer.cornerRadius = 8
        containerView.alignToCenter(subview: label)
    }
    
    func update(with text: String, isAvailable: Bool, isSelected: Bool) {
        label.text = text
        containerView.backgroundColor = isAvailable ? .appRed : .appGray
        contentView.layer.borderColor = isSelected && isAvailable ? UIColor.appRed?.cgColor : UIColor.clear.cgColor
    }
}
