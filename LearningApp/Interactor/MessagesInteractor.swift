//
//  MessagesInteractor.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import Foundation

protocol MessagesInteractionLogic {
    func getUser()
    func getMessages()
    func filterMessages(_ string: String)
}

class MessagesInteractor: MessagesInteractionLogic {
    
    var dataStore : DataStore = DataStore.shared
    var presenter : MessagesPresentationLogic?
    
    func getUser() {
        guard let user = dataStore.user else { return }
        presenter?.presentUser(user)
    }
    
    func getMessages() {
        guard let user = dataStore.user else { return }
        let chats = user.chats
        presenter?.presentChats(chats)
    }
    
    func filterMessages(_ string: String) {
        guard let user = dataStore.user else { return }
        let filteredChats = user.chats.filter({$0.person.name.lowercased().contains(string.lowercased())})
        presenter?.presentChats(filteredChats)
    }
}
