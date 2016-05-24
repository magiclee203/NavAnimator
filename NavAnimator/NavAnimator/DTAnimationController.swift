//
//  DTAnimationController.swift
//  NavAnimator
//
//  Created by 李晓萌 on 16/5/24.
//
//

import UIKit

class DTAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    static let sharedAnimator = DTAnimationController()
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let toViewEndFrame = transitionContext.finalFrameForViewController(toViewController)
        var toViewStartFrame = toViewEndFrame
        toViewStartFrame.origin.y -= toViewEndFrame.size.height
        
        let containerView = transitionContext.containerView()!
        containerView.addSubview(toView)
        toView.frame = toViewStartFrame
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
            toView.frame = toViewEndFrame
            }, completion: { _ in
                transitionContext.completeTransition(true)
        })
    }
}
