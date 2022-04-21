//
//  HomeConfigurator.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import Foundation

final class HomeConfigurator {
    
    static func configure() -> HomeViewController {
        let viewController = HomeViewController()
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
}
