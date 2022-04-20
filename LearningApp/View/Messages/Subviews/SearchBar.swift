//
//  SearchBar.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import UIKit

class SearchBar: UIView {
    
    var textChanged: ((String?) -> Void)?
    
    private let textField = UITextField.makeForApp(placeholder: "Search here")
    private let searchButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        self.pinToEdges(subview: textField)
        textField.addTarget(nil, action: #selector(textChanged(_:)), for: .editingChanged)
        self.pinToEdges(subview: searchButton, leading: nil, trailing: 6, top: 6, bottom: 6)
        searchButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        searchButton.backgroundColor = .appRed
        searchButton.layer.cornerRadius = 8
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold)
        searchButton.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: config), for: .normal)
        searchButton.tintColor = .white
    }
    
    @objc func textChanged(_ sender: UITextField) {
        textChanged?(sender.text)
    }
    
    func dropButtonShadow() {
        searchButton.dropShadow(color: .appRed!, height: 2, shadowRadius: 5, opacity: 0.2, cornerRadius: 8)
    }
}
