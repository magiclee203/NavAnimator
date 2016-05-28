//
//  DTAnimationController.swift
//  NavAnimator
//
//  Created by 李晓萌 on 16/5/24.
//
//

import UIKit

class DTAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var operation: UINavigationControllerOperation = .None
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let containerView = transitionContext.containerView()!
        containerView.addSubview(toView)
        
        let fromViewStartFrame = transitionContext.initialFrameForViewController(fromViewController)
        let toViewEndFrame = transitionContext.finalFrameForViewController(toViewController)
        var fromViewEndFrame = fromViewStartFrame
        var toViewStartFrame = toViewEndFrame
        
        if operation == .Push {
            toViewStartFrame.origin.y -= toViewEndFrame.size.height
        } else if operation == .Pop {
            fromViewEndFrame.origin.y -= fromViewStartFrame.size.height
            containerView.sendSubviewToBack(toView)
        }
        
        fromView.frame = fromViewStartFrame
        toView.frame = toViewStartFrame
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
            fromView.frame = fromViewEndFrame
            toView.frame = toViewEndFrame
            }, completion: { _ in
                transitionContext.completeTransition(true)
        })
    }
}
