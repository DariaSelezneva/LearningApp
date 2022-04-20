//
//  ChatViewModel.swift
//  LearningApp
//
//  Created by Daria on 19.04.2022.
//

import Foundation
import UIKit

struct ChatViewModel {
    var personID: Int
    var name: String
    var image: UIImage
    var isOnline: Bool
    var lastMessage: String
    var newMessages: Int
    var date: String
}

extension ChatViewModel {
    init(from chat: Chat) {
        personID = chat.person.id
        name = chat.person.name
        image = chat.person.image ?? UIImage(systemName: "person")!
        isOnline = chat.person.isOnline
        let last = chat.messages.sorted(by: >).first
        let lastText = last?.text ?? "No messages yet"
        lastMessage = lastText
        let newMessagesCount = chat.messages.filter({!$0.isRead}).count
        newMessages = newMessagesCount
        date = last != nil ? last!.date.textForChat() : ""
    }
}
