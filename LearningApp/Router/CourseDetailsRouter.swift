//
//  CourseDetailsRouter.swift
//  LearningApp
//
//  Created by Daria on 18.04.2022.
//

import Foundation
import UIKit

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
        followClassVC.modalPresentationStyle = .overFullScreen
        sourceVC.present(followClassVC, animated: true) {
            UIView.animate(withDuration: 0.1) {
                followClassVC.view.backgroundColor = .black.withAlphaComponent(0.3)
            }
        }
    }
}
