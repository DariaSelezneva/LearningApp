//
//  MainTabBarController.swift
//  LearningApp
//
//  Created by Daria on 12.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let homeVC = HomeViewController()
    let exploreVC = ExploreViewController()
    let messagesVC = MessagesViewController()
    let userVC = UserViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Menu"), selectedImage: UIImage(named: "Menu_fill"))
        exploreVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Discovery"), selectedImage: UIImage(named: "Discovery"))
        messagesVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Message"), selectedImage: UIImage(named: "Message_fill"))
        userVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Profile"), selectedImage: UIImage(named: "Profile"))
        viewControllers = [homeVC, exploreVC, messagesVC, userVC]
        tabBar.backgroundColor = .white
        tabBar.tintColor = .red
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.08
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        tabBar.layer.shadowRadius = 10
    }
}