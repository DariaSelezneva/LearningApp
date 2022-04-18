//
//  CourseDetailsInteractor.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import Foundation

protocol CourseDetailsInteractionLogic {
    func setFavorite(courseID: Int)
}

final class CourseDetailsInteractor: CourseDetailsInteractionLogic {
    
    var dataStore : DataStore = DataStore.shared
    var presenter : CourseDetailsPresentationLogic?
    
    func setFavorite(courseID: Int) {
        guard let user = dataStore.user else { return }
        if user.favoriteCourses.contains(where: {$0 == courseID}) {
            dataStore.user?.favoriteCourses.removeAll(where: {$0 == courseID})
            presenter?.presentFavorite(isFavorite: false)
        }
        else {
            dataStore.user?.favoriteCourses.append(courseID)
            presenter?.presentFavorite(isFavorite: true)
        }
    }
}
