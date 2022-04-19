//
//  CalendarButton.swift
//  LearningApp
//
//  Created by Daria on 19.04.2022.
//

import UIKit

class CalendarButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup() {
        backgroundColor = .appGray
        layer.cornerRadius = 8
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .default)
        setImage(UIImage(systemName: "calendar", withConfiguration: config), for: .normal)
        tintColor = .white
    }
}
