//
//  e_UILabel.swift
//  LearningApp
//
//  Created by Daria on 19.04.2022.
//

import Foundation
import UIKit

extension UILabel {
    static func make(fontName: String, size: CGFloat, textColor: UIColor?, numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: fontName, size: size)
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        if numberOfLines != 0 {
            label.lineBreakMode = .byTruncatingTail
        }
        label.textAlignment = .natural
        return label
    }
    
    func updateForCourseDuration(_ duration: String) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "stopwatch")?.withTintColor(.appGray!)
        imageAttachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        let durationString = NSMutableAttributedString(string: "  " + duration)
        durationString.insert(NSAttributedString(attachment: imageAttachment), at: 0)
        self.attributedText = durationString
    }
}
