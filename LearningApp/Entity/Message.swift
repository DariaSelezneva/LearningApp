//
//  Message.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import Foundation

struct Message {
    var sender: Person
    var text: String
    var date: Date
    var isRead: Bool
    
    static let sample = [
        Message(sender: Person.danny, text: "Would you like to have dinner today?", date: Date().addingTimeInterval(-60), isRead: false),
        Message(sender: Person.capaldi, text: "Clara, where are you?", date: Date().addingTimeInterval(-660), isRead: false)
    ]
}
