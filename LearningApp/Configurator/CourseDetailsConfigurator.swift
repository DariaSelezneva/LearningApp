//
//  CourseDetailsConfigurator.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import Foundation

final class CourseDetailsConfigurator {
    
    static let shared = CourseDetailsConfigurator()
    
    private init() {}
    
    func configure(viewController: CourseDetailsViewController) {
        let interactor = CourseDetailsInteractor()
        let presenter = CourseDetailsPresenter()
        let router = CourseDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
}
