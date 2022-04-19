//
//  ScheduleStatusView.swift
//  LearningApp
//
//  Created by Daria on 19.04.2022.
//

import UIKit

class ScheduleStatusView: UIView {
    
    var dateAndTime: String = "12 October, 2020 at 09.45 AM" {
        didSet {
            dateTimeLabel.text = dateAndTime
        }
    }
    
    private let commonStackView = UIStackView()
    private let horizontalStackView = UIStackView()
    private let titleLabel = UILabel.make(fontName: poppinsSemiBold, size: 14, textColor: .appDarkGray)
    private let checkboxButton = UIButton()
    private let dateTimeLabel = UILabel.make(fontName: poppinsRegular, size: 16, textColor: .appGray)

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup() {
        self.pinToEdges(subview: commonStackView)
        commonStackView.axis = .vertical
        commonStackView.spacing = 8
        commonStackView.addArrangedSubview(titleLabel)
        commonStackView.addArrangedSubview(horizontalStackView)
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        horizontalStackView.alignment = .center
        horizontalStackView.addArrangedSubview(checkboxButton)
        horizontalStackView.addArrangedSubview(dateTimeLabel)
        let config = UIImage.SymbolConfiguration(pointSize: 9, weight: .heavy)
        checkboxButton.setImage(UIImage(systemName: "checkmark", withConfiguration: config), for: .normal)
        checkboxButton.layer.cornerRadius = 4
        checkboxButton.backgroundColor = .appRed?.withAlphaComponent(0.4)
        checkboxButton.setDimensions(width: 20, height: 20)
        checkboxButton.tintColor = .appRed
        titleLabel.text = "Schedule date and time"
        dateTimeLabel.text = dateAndTime
    }
}
