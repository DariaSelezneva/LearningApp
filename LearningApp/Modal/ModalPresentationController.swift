//
//  ModalPresentationController.swift
//  LearningApp
//
//  Created by Daria on 19.04.2022.
//

import UIKit

class ModalPresentationController: UIPresentationController {
    
    var driver: TransitionDriver!
    
    private lazy var dimmView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.alpha = 1
        return view
    }()
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let bounds = containerView!.bounds
        let height = bounds.height - 130
        return CGRect(x: 0, y: 130, width: bounds.width, height: height)
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        if completed {
            driver.direction = .dismiss
        }
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        containerView?.addSubview(dimmView)
        containerView?.addSubview(presentedView!)
        print(dimmView.frame)
        performAlongsideTransitionIfPossible { [unowned self] in
            self.dimmView.alpha = 1
        }
    }
    
    private func performAlongsideTransitionIfPossible(_ block: @escaping () -> Void) {
        guard let coordinator = self.presentedViewController.transitionCoordinator else {
            block()
            return
        }
        
        coordinator.animate(alongsideTransition: { (_) in
            block()
        }, completion: nil)
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        dimmView.frame = containerView!.frame
        print(dimmView.frame)
        presentedView?.frame = frameOfPresentedViewInContainerView
        
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        performAlongsideTransitionIfPossible { [unowned self] in
            self.dimmView.alpha = 0
        }
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        if completed {
            self.dimmView.removeFromSuperview()
        }
    }
}
