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

class CourseDetailsRouter: NSObject, CourseDetailsRoutingLogic {
    
    var dataStore : DataStore = DataStore.shared
    weak var viewController: CourseDetailsDisplayLogic?
    
    private let driver = TransitionDriver()
    
    func showSchedule(courseID: Int) {
        guard let sourceVC = viewController,
              let course = dataStore.courses.first(where: { $0.id == courseID}) else { return }
        let followClassVC = FollowClassViewController()
        followClassVC.transitioningDelegate = self
        followClassVC.modalPresentationStyle = .custom
        sourceVC.present(followClassVC, animated: true)
    }
}

extension CourseDetailsRouter : UIViewControllerTransitioningDelegate {
    
    // MARK: - Presentation
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        driver.link(to: presented)
        let presentationController = ModalPresentationController(presentedViewController: presented, presenting: presenting ?? source)
        presentationController.driver = driver
        return presentationController
    }
    
    // MARK: - Animation
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimation()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimation()
    }
    
    // MARK: - Interaction
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return driver
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return driver
    }
}
