//
//  FollowClassViewController.swift
//  LearningApp
//
//  Created by Дарья Селезнёва on 15.04.2022.
//

import UIKit

class FollowClassViewController: UIViewController {
    
    private let scrollViewContainer = UIView()
    private let scrollView = UIScrollView()
    
    private let containerView = UIView()
    private let dragView = UIView()
    
    private let scheduleView = ScheduleView()
    
    private let emailView = FormUnitView(title: "Email", placeholder: "Enter email here")
    private let telView = FormUnitView(title: "Tel number", placeholder: "+7 (xxx) xxx xx xx")
    private let scheduleStatusView = ScheduleStatusView()
    
    private let loginButton = UIButton()
    
    private var topConstraint = NSLayoutConstraint()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications(for: scrollView)
        hideKeyboardWhenTappedAround()
        view.pinToEdges(subview: scrollViewContainer)
//        topConstraint = scrollViewContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 130)
//        topConstraint.isActive = true
        scrollViewContainer.backgroundColor = .white
        scrollViewContainer.layer.cornerRadius = 24
        scrollViewContainer.addSubview(dragView)
        dragView.translatesAutoresizingMaskIntoConstraints = false
        dragView.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: 12).isActive = true
        dragView.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor).isActive = true
        dragView.setDimensions(width: 80, height: 8)
        dragView.layer.cornerRadius = 4
        dragView.backgroundColor = .appGray
        scrollViewContainer.pinToEdges(subview: scrollView, top: 20)
        scrollView.setWidth(equalTo: scrollViewContainer)
        scrollView.pinToEdges(subview: containerView)
        containerView.setWidth(equalTo: scrollView)
        containerView.pinToEdges(subview: scheduleView, leading: 32, trailing: 32, top: 24, bottom: nil)
        let formStackView = UIStackView()
        containerView.pinToEdges(subview: formStackView, leading: 16, trailing: 16, top: nil, bottom: nil)
        formStackView.topAnchor.constraint(equalTo: scheduleView.bottomAnchor, constant: 20).isActive = true
        formStackView.axis = .vertical
        formStackView.spacing = 16
        formStackView.addArrangedSubview(emailView)
        formStackView.addArrangedSubview(telView)
        formStackView.addArrangedSubview(scheduleStatusView)
        containerView.pinToEdges(subview: loginButton, leading: 16, trailing: 16, top: nil, bottom: 40)
        loginButton.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 34).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        loginButton.backgroundColor = .appRed
        loginButton.layer.cornerRadius = 8
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: poppinsMedium, size: 16)
        scheduleView.update(with: ScheduleViewModel.sample)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scheduleView.calendarButton.dropShadow(color: .appRed!, height: 3, shadowRadius: 5, opacity: 0.3, cornerRadius: 8)
        loginButton.dropShadow(color: .appRed!, height: 3, shadowRadius: 5, opacity: 0.3, cornerRadius: 8)
    }
}

extension FollowClassViewController: KeyboardHandler {}
