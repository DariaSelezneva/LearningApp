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
    
    var interactor : HomeInteractionLogic?
    var router : HomeRoutingLogic?
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let stackView = UIStackView()
    
    private let userView = UserView()
    private let streamingView = StreamingView()
    private let coursesView = CoursesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.pinToEdges(subview: scrollView)
        scrollView.setWidth(equalTo: view)
        scrollView.pinToEdges(subview: containerView)
        containerView.setWidth(equalTo: scrollView)
        containerView.pinToEdges(subview: stackView, leading: 20, trailing: 20, top: nil, bottom: 16)
        stackView.topAnchor.constraint(equalTo: containerView.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(userView)
        stackView.addArrangedSubview(streamingView)
        stackView.addArrangedSubview(coursesView)
        streamingView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        coursesView.filterView.onSelection = { [unowned self] filter in
            if filter == "All" {
                displayCourses(CourseViewModel.sample)
            }
            else {
                displayCourses(CourseViewModel.sample.filter({$0.theme == filter}))
            }
        }
        coursesView.coursesCollectionView.onSelection = { [unowned self] courseID in
            interactor?.didSelectCourse(courseID)
        }
        displayUser(UserViewModel.sample)
        displayStreamers(StreamerViewModel.sample)
        displayCourseFilters(["All", "TARDIS", "Creatures", "Other"])
        displayCourses(CourseViewModel.sample)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
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
        coursesView.update(courses: courses)
    }
}
