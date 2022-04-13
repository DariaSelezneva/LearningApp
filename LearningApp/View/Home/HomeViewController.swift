//
//  HomeViewController.swift
//  LearningApp
//
//  Created by Daria on 12.04.2022.
//

import UIKit

protocol HomeDisplayLogic {
    func displayUser(_ user: UserViewModel)
    func displayStreamers(_ streamers: [StreamerViewModel])
    func displayCourseFilters(_ filters: [String])
    func displayCourses(_ courses: [CourseViewModel])
}

class HomeViewController: UIViewController {
    
    private let userView = UserView()
    private let streamingView = StreamingView()
    private let coursesView = CoursesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.pinToLayoutMargins(subview: userView, bottom: nil)
        view.pinToLayoutMargins(subview: streamingView, top: nil, bottom: nil)
        streamingView.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: 12).isActive = true
        streamingView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.pinToLayoutMargins(subview: coursesView, top: nil, bottom: nil)
        coursesView.topAnchor.constraint(equalTo: streamingView.bottomAnchor, constant: 12).isActive = true
        coursesView.filterView.onSelection = { index in
            
        }
        displayUser(UserViewModel.sample)
    }
}

extension HomeViewController: HomeDisplayLogic {
    
    func displayUser(_ user: UserViewModel) {
        userView.update(with: user)
    }
    
    func displayStreamers(_ streamers: [StreamerViewModel]) {
        streamingView.update(with: streamers)
    }
    
    func displayCourseFilters(_ filters: [String]) {
        coursesView.filterView.update(with: filters)
    }
    
    func displayCourses(_ courses: [CourseViewModel]) {
        
    }
}
