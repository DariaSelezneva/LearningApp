//
//  e_UITextField.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import Foundation
import UIKit

extension UITextField {
    
    static func makeForApp(placeholder: String = "") -> UITextField {
        let textField = UITextField()
        textField.layer.cornerRadius = 6
        textField.backgroundColor = .appLightGray2
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 56))
        textField.leftViewMode = .always
        textField.font = UIFont(name: poppinsRegular, size: 16)
        textField.textColor = .appDarkGray
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.appGray!,
            NSAttributedString.Key.font : UIFont(name: poppinsRegular, size: 16)!]
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        return textField
    }
}
