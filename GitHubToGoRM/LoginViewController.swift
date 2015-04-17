//
//  LoginViewController.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/16/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  let imageViewWidth : CGFloat = 200
  let imageViewHeight : CGFloat = 200
  let imageViewX : CGFloat = 0
  let imageViewY :CGFloat = 0
  
  let floatingAnimationDuration : NSTimeInterval = 1.3
  let imageViewDropHeight : CGFloat = 7
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      let imageView = UIImageView(frame: CGRect(x: imageViewX, y: imageViewY, width: imageViewWidth, height: imageViewHeight))
      imageView.image = UIImage(named: "githublogo")
      imageView.center = self.view.center
      
      self.view.addSubview(imageView)
      
      // animations
      UIView.animateWithDuration(floatingAnimationDuration, delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: { [unowned self]() -> Void in
        
        imageView.center = CGPoint(x: imageView.center.x, y: imageView.center.y + self.imageViewDropHeight)
      }, completion: nil)

    } // ViewDidLoad

  @IBAction func myLoginPressed(sender: AnyObject) {
    // calling the class method from the OAuth class 
    
    // object conforms to the AppDelegate class.
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let oAuthService = appDelegate.myOathService
    
    // setup  when the entire process is finished when the entire OAuth process is complete. 
    oAuthService.requestOAuth { [weak self]() -> () in
      // if we recieve good token, transition to main menu screen. 
      if self != nil {
        // create a sandbox to to the transition to go from the current window to a new window.
        let window = appDelegate.window
        let navController = self?.storyboard?.instantiateViewControllerWithIdentifier("mainMenuNav") as!
        UINavigationController
        
        UIView.transitionFromView(self!.view, toView: navController.view, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: { (finished) -> Void in
          window?.rootViewController = navController
        })
              } // self != nil
    } // completionHandler
  } // myLoginPressed
  
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // myLoginPressed

}
