//
//  HomeRouter.swift
//  LearningApp
//
//  Created by Дарья Селезнёва on 15.04.2022.
//

import Foundation

protocol HomeRoutingLogic {
    func navigateToCourseDetails(courseID: Int)
}

class HomeRouter: HomeRoutingLogic {
    
    var dataStore : DataStore = DataStore.shared
    
    weak var viewController : HomeDisplayLogic?
    
    func navigateToCourseDetails(courseID: Int) {
        guard let sourceVC = viewController,
              let course = dataStore.courses.first(where: { $0.id == courseID}) else { return }
        let destinationVC = CourseDetailsConfigurator.configure()
        let isFavorite = dataStore.user?.favoriteCourses.contains(where: {$0 == courseID}) ?? false
        let courseDetailsViewModel = CourseDetailsViewModel(from: course, isFavorite: isFavorite)
        destinationVC.display(courseDetailsViewModel)
        destinationVC.displayFavorite(isFavorite: isFavorite)
        sourceVC.navigationController?.pushViewController(destinationVC, animated: true)
        if let tabbarController = sourceVC.tabBarController as? MainTabBarController {
            tabbarController.customTabBar.isHidden = true
        }
    }
}
