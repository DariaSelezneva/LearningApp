//
//  User.swift
//  LearningApp
//
//  Created by Daria on 13.04.2022.
//

import Foundation
import UIKit

struct UserViewModel {
    var name: String
    var image: UIImage?
    var reward: Int?
    var isOnline: Bool
    var newMessagesCount: String
    var hasNotifications: Bool
}

extension UserViewModel {
    init(from user: User) {
        self.name = user.name
        self.image = user.image ?? UIImage(systemName: "person")!
        self.reward = user.reward
        self.isOnline = user.isOnline
        let newMessagesCount = user.messages.filter({!$0.isRead}).count
        let newMessagesCountString = newMessagesCount == 0 ? "No" : String(newMessagesCount)
        self.newMessagesCount = "\(newMessagesCountString) new messages"
        self.hasNotifications = user.notifications.isEmpty
    }
}
