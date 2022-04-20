//
//  MessagesConfigurator.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import Foundation

final class MessagesConfigurator {
    
    static let shared = MessagesConfigurator()
    
    private init() {}
    
    func configure(viewController: MessagesViewController) {
        let interactor = MessagesInteractor()
        let presenter = MessagesPresenter()
        let router = MessagesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
}

