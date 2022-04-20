//
//  Message.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import Foundation

struct Message {
    var id: Int
    var personID: Int
    var text: String
    var date: Date
    var isRead: Bool
}

extension Message: Comparable {
    static func < (lhs: Message, rhs: Message) -> Bool {
        return lhs.date < rhs.date
    }
}
