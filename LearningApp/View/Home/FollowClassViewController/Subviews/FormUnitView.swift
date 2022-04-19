//
//  FormUnitView.swift
//  LearningApp
//
//  Created by Daria on 19.04.2022.
//

import UIKit

class FormUnitView: UIView {
    
    var labelText: String = "" {
        didSet {
            label.text = labelText
        }
    }
    
    var textFieldText: String = "" {
        didSet {
            textField.text = textFieldText
        }
    }
    
    var placeholder: String = "" {
        didSet {
            let attributes = [
                NSAttributedString.Key.foregroundColor : UIColor.appGray!,
                NSAttributedString.Key.font : UIFont(name: poppinsRegular, size: 16)!]
            textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        }
    }
    
    var delegate: UITextFieldDelegate? {
        didSet {
            textField.delegate = delegate
        }
    }
    
    private let stackView = UIStackView()
    private let label = UILabel.make(fontName: poppinsSemiBold, size: 14, textColor: .appDarkGray)
    private let textField = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, placeholder: String) {
        self.init(frame: .zero)
        self.label.text = title
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.appGray!,
            NSAttributedString.Key.font : UIFont(name: poppinsRegular, size: 16)!]
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
    
    func initialSetup() {
        self.pinToEdges(subview: stackView)
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)
        textField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        textField.setWidth(equalTo: self)
        textField.layer.cornerRadius = 6
        textField.backgroundColor = .appLightGray2
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 56))
        textField.leftViewMode = .always
        textField.font = UIFont(name: poppinsRegular, size: 16)
        textField.textColor = .appDarkGray
    }
}
