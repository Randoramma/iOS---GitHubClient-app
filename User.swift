//
//  User.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/17/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit


class User {
  
  let login : String
  let avatarURL : String
  let htmlURL : String
 // let name : String
  var avatarImage : UIImage?
  
  init (theLogin : String, theAvatarURL : String, theHtmlURL : String, theName : String) {
    login = theLogin
    avatarURL = theAvatarURL
    htmlURL = theHtmlURL
   // name = theName
  } // init
}