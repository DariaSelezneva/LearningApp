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
    var image: UIImage
    var reward: Int?
    var isOnline: Bool
    var hasNotifications: Bool
    
    static let sample = UserViewModel(name: "Clara", image: UIImage(named: "clara")!, reward: 1600, isOnline: true, hasNotifications: true)
}
