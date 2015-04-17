//
//  AppDelegate.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/13/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  let myOathService = OAuthService()

  // method is called when any other application is called by our application on the device.  
  func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
    
    // pass us back to the
    self.myOathService.handleRedirect(url)
    //myOathService.handleRedirect(url)
    return true
  }

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    // look for a token inside the user defaults 
    if let token = NSUserDefaults.standardUserDefaults().objectForKey("gitHubToken") as? String {
      // if we dont have a token, the root vc must be the login VC.
      if let currentRootVC = self.window?.rootViewController as? LoginViewController,
        storyboard = currentRootVC.storyboard {
          // if we have a token, we want the rootVC set equal to here.
          let navVC =
          storyboard.instantiateViewControllerWithIdentifier("mainMenuNav") as! UINavigationController
          window?.rootViewController = navVC
      }
      
    } // NSUserDefaults.standardUserDefaults()
    return true
  } // didFinishLaunchingWithOptions

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

