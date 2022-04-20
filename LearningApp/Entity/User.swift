//
//  User.swift
//  LearningApp
//
//  Created by Daria on 14.04.2022.
//

import UIKit

struct User {
    var id: Int
    var name: String
    var image: UIImage?
    var points: Int
    var reward: Int?
    var isOnline: Bool
    var courses: [Int]
    var favoriteCourses: [Int]
    var notifications: [String]
    var chats: [Chat]
    
    var newMessagesCount: Int {
        chats
            .map({$0.messages})
            .reduce([]){$0 + $1}
            .filter({!$0.isRead})
            .count
    }
    
    static let sample = User(
        id: 0,
        name: "Clara",
        image: UIImage(named: "clara"),
        points: 2000,
        reward: 1600,
        isOnline: true,
        courses: [],
        favoriteCourses: [Course.sample[0].id],
        notifications: ["New notification"],
        chats: Chat.sample)
}
