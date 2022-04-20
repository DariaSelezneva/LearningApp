//
//  MessagesRouter.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import Foundation

protocol MessagesRoutingLogic {
    func navigateToChat(chatID: Int)
}

final class MessagesRouter: MessagesRoutingLogic {
    
    var dataStore : DataStore = DataStore.shared
    weak var viewController: MessagesDisplayLogic?
    
    func navigateToChat(chatID: Int) {
        
    }
}
