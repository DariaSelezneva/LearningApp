//
//  CourseDetailsPresenter.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import Foundation

protocol CourseDetailsPresentationLogic {
    func presentFavorite(isFavorite: Bool)
}

class CourseDetailsPresenter: CourseDetailsPresentationLogic {
    
    var viewController : CourseDetailsDisplayLogic?
    
    func presentFavorite(isFavorite: Bool) {
        viewController?.displayFavorite(isFavorite: isFavorite)
    }
}
