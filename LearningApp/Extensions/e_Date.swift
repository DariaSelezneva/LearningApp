//
//  e_Date.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import Foundation

extension Date {
    
    func textForChat() -> String {
        
            let timeInterval = Calendar.current.dateComponents([.second], from: self, to: Date())
            let seconds = timeInterval.second!
            var text: String = ""
            switch seconds {
            case 0:
                text = "Right now"
            case 1...59:
                text = "\(seconds) sec"
            case 60...3599:
                let minutes = seconds / 60
                text = "\(minutes) min"
            case 3600...14400:
                let hours = seconds / 3600
                text = "\(hours) h"
            case 14401...86399:
                text = "Today"
            case 86400...(86400 * 2):
                text = "Yesterday"
            default:
                let formatter = DateFormatter()
                formatter.dateStyle = .short
                formatter.timeStyle = .none
                text = formatter.string(from: self)
            }
            return text
        }
}
