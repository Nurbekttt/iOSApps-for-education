//
//  AnimationController.swift
//  animation
//
//  Created by Nurbek on 11/17/19.
//  Copyright © 2019 Nurbek. All rights reserved.
//
//
import UIKit
class AnimationController: NSObject,UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(3)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let _ = transitionContext.viewController(forKey: .from) else { return }
        
        transitionContext.containerView.addSubview(toViewController.view)   
        presentAnimation(with: transitionContext, viewToAnimate: toViewController.view)
    }
    func presentAnimation(with transitionContext:UIViewControllerContextTransitioning, viewToAnimate:UIView){
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: 0.80,
                       initialSpringVelocity: 0.1,
                       options: .curveEaseInOut,
                       animations: {
                        viewToAnimate.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        }, completion: { _ in
                            transitionContext.completeTransition(true)
                            })
        
    }
    
}
