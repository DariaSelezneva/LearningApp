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
    var hasNotifications: Bool
}

extension UserViewModel {
    init(from user: User) {
        self.name = user.name
        self.image = user.image ?? UIImage(systemName: "person")!
        self.reward = user.reward
        self.isOnline = user.isOnline
        self.hasNotifications = user.notifications.isEmpty
    }
}
