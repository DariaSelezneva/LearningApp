//
//  MessagesConfigurator.swift
//  LearningApp
//
//  Created by Daria on 20.04.2022.
//

import Foundation

final class MessagesConfigurator {
    
    static func configure() -> MessagesViewController {
        let viewController = MessagesViewController()
        let interactor = MessagesInteractor()
        let presenter = MessagesPresenter()
        let router = MessagesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}

