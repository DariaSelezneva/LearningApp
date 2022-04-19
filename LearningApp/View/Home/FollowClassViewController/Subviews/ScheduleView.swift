//
//  ScheduleView.swift
//  LearningApp
//
//  Created by Daria on 19.04.2022.
//

import UIKit

class ScheduleView: UIView {

    private let titleLabel = UILabel.make(fontName: poppinsSemiBold, size: 18, textColor: .darkGray)
    private let descriptionLabel = UILabel.make(fontName: poppinsRegular, size: 16, textColor: .appGray2)
    
    let calendarButton = CalendarButton()
    
    private let scheduleCollectionView = ScheduleCollectionView()
    private var scheduleCollectionViewHeightConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        let stackView = UIStackView()
        self.pinToEdges(subview: stackView, bottom: nil)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        let labelsStackView = UIStackView()
        stackView.addArrangedSubview(labelsStackView)
        stackView.addArrangedSubview(calendarButton)
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 4
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(descriptionLabel)
        titleLabel.text = "Available time"
        descriptionLabel.text = "Adjust to your schedule"
        calendarButton.setDimensions(width: 44, height: 44)
        self.pinToEdges(subview: scheduleCollectionView, leading: -4, trailing: nil, top: nil)
        scheduleCollectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 32).isActive = true
        scheduleCollectionView.widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    func update(with source: [ScheduleViewModel]) {
        let rowsCount = ceil(CGFloat(source.count) / 3.0)
        scheduleCollectionViewHeightConstraint = scheduleCollectionView.heightAnchor.constraint(equalToConstant: rowsCount * 55)
        scheduleCollectionViewHeightConstraint.isActive = true
        scheduleCollectionView.update(with: source)
    }
}
