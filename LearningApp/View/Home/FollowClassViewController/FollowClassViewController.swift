//
//  FollowClassViewController.swift
//  LearningApp
//
//  Created by Дарья Селезнёва on 15.04.2022.
//

import UIKit

class FollowClassViewController: UIViewController {
    
    let containerView = UIView()
    let dragView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.pinToEdges(subview: containerView, top: 130)
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 24
        containerView.addSubview(dragView)
        dragView.translatesAutoresizingMaskIntoConstraints = false
        dragView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12).isActive = true
        dragView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        dragView.setDimensions(width: 80, height: 8)
    }
}
