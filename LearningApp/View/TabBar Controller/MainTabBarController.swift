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
    
    let customTabBar = AppTabBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        view.pinToEdges(subview: customTabBar, top: nil)
        customTabBar.heightAnchor.constraint(equalToConstant: AppTabBar.height).isActive = true
        customTabBar.didSelectItem = { index in
            self.selectedIndex = index
        }
        HomeConfigurator.shared.configure(viewController: homeVC)
        MessagesConfigurator.shared.configure(viewController: messagesVC)
        if let count = DataStore.shared.user?.newMessagesCount, count != 0 {
            customTabBar.messagesItem.badgeValue = String(count)
        }
        else {
            customTabBar.messagesItem.badgeValue = nil
        }
        userVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Profile"), selectedImage: UIImage(named: "Profile"))
        viewControllers = [UINavigationController(rootViewController: homeVC), exploreVC, messagesVC, userVC]
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor.appRed
        tabBar.unselectedItemTintColor = UIColor.appTabGray
        customTabBar.dropShadow(color: .black, height: -3, shadowRadius: 10, opacity: 0.08, cornerRadius: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        customTabBar.dropShadow(color: .black, height: -3, shadowRadius: 10, opacity: 0.08, cornerRadius: 0)
    }
}
