//
//  MessagesPresenter.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import Foundation

protocol MessagesPresentationLogic {
    func presentUser(_ user: User)
    func presentChats(_ chats: [Chat])
}

class MessagesPresenter: MessagesPresentationLogic {
    
    var viewController : MessagesDisplayLogic?
    
    func presentUser(_ user: User) {
        let viewModel = UserViewModel.init(from: user)
        viewController?.displayUser(viewModel)
    }
    
    func presentChats(_ chats: [Chat]) {
        let chatViewModels = chats.map({ChatViewModel.init(from: $0)})
        viewController?.displayChats(chatViewModels)
    }
}
