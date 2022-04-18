//
//  HomeConfigurator.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import Foundation

final class HomeConfigurator {
    
    static let shared = HomeConfigurator()
    
    private init() {}
    
    func configure(viewController: HomeViewController) {
        var interactor = HomeInteractor()
        var presenter = HomePresenter()
        var router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
}
