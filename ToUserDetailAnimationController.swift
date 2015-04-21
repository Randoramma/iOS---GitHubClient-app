//
//  ToUserDetailAnimationController.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/18/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit


class ToUserDetailAnimationController : NSObject, UIViewControllerAnimatedTransitioning {
  
  var duration = 0.4
  
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
    return duration
  } // transitionDuration
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    
    // setup the stage for the transition.
    let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! UserSearchViewController
    let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! UserDetailViewController
    let containerView = transitionContext.containerView()
    
    toVC.view.alpha = 0
    containerView.addSubview(toVC.view)
    
    /*
    why does it matter where we unwrap the index path, either at the array in line 34 or as suggegested by Xcode
    at the cell on line 35
    */
    let selectedIndexPath = fromVC.myUserCollectionView.indexPathsForSelectedItems().first as! NSIndexPath
    let userCell = fromVC.myUserCollectionView.cellForItemAtIndexPath(selectedIndexPath) as! UserCell
    let snapShot = userCell.myUserImageView.snapshotViewAfterScreenUpdates(false)
    // now we can move this snapshot object around, and it will appear just as the cell is moving to the user.
    userCell.hidden = true
    snapShot.frame = containerView.convertRect(userCell.myUserImageView.frame, fromCoordinateSpace: userCell.myUserImageView.superview!)
    containerView.addSubview(snapShot)
    // enable auto layout
    toVC.view.layoutIfNeeded()
    
    let frame = containerView.convertRect(toVC.myUserDetailImageView.frame, fromView: toVC.view)
    
    toVC.myUserDetailImageView.hidden = true
    
    UIView.animateWithDuration(duration, animations: { () -> Void in
      
      toVC.view.alpha = 1
      snapShot.frame = frame
      
      // completion block to remove the snapshot object from the VC.
      }) { (finished) -> Void in
        
        if finished {
          toVC.myUserDetailImageView.hidden = false
          snapShot.removeFromSuperview()
          userCell.hidden = false
          // you must tell the transition context
          transitionContext.completeTransition(true)
        } else {
          transitionContext.completeTransition(false)
        }
    } // completion block
  } // animateTransition
}