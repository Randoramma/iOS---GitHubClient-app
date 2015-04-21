//
//  UserDetailViewController.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/18/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
  
  // parameters
  @IBOutlet weak var myUserDetailImageView: UIImageView!
  @IBOutlet weak var myUserDetailName: UILabel!
  @IBOutlet weak var myUserDetailLocation: UILabel!
  var mySelectedUser : User!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.myUserDetailImageView.image = mySelectedUser.avatarImage    
    self.myUserDetailName.text = mySelectedUser.login
    //self.myUserDetailLocation.text = mySelectedUser.location

  } // viewDidLoad
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
