//
//  HomePresenter.swift
//  LearningApp
//
//  Created by Daria on 14.04.2022.
//

import Foundation

protocol HomePresentationLogic {
    func presentUser(_ user: User)
    func presentStreamers(_ streamers: [Streamer])
    func presentFilters(_ filters: [String], selectedFilter: Int)
    func presentCourses(_ courses: [Course])
}

class HomePresenter: HomePresentationLogic {
    
    var viewController : HomeDisplayLogic?
    
    func presentUser(_ user: User) {
        let userViewModel = UserViewModel(from: user)
        viewController?.displayUser(userViewModel)
    }
    
    func presentStreamers(_ streamers: [Streamer]) {
        let streamersViewModel = streamers.map({StreamerViewModel.init(from: $0)})
        viewController?.displayStreamers(streamersViewModel)
    }
    
    func presentFilters(_ filters: [String], selectedFilter: Int) {
        viewController?.displayCourseFilters(filters, selectedFilter: selectedFilter)
    }
    
    func presentCourses(_ courses: [Course]) {
        let coursesViewModel = courses.map({CourseViewModel(from: $0)})
        viewController?.displayCourses(coursesViewModel)
    }
}
