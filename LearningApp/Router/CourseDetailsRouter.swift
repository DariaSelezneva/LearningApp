//
//  CourseDetailsRouter.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import Foundation

protocol CourseDetailsRoutingLogic {
    func showSchedule(courseID: Int)
}

class CourseDetailsRouter: CourseDetailsRoutingLogic {
    
    var dataStore : DataStore = DataStore.shared
    weak var viewController: CourseDetailsDisplayLogic?
    
    func showSchedule(courseID: Int) {
        guard let sourceVC = viewController,
              let course = dataStore.courses.first(where: { $0.id == courseID}) else { return }
        let followClassVC = FollowClassViewController()
        sourceVC.present(followClassVC, animated: true)
    }
}
