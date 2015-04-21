//
//  UserJSONParser.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/18/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import Foundation

class UserJSONParser {
  
  class func usersFromJSONData(data : NSData) -> [User] {
    
    
    var users = [User]()
    var jsonError : NSError?
    
    if let jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? [String: AnyObject],
    items = jsonDictionary["items"] as? [[String: AnyObject]] {
      for item in items {
        println(items.debugDescription)
        if let
        login = item["login"] as? String,
        avatarURL = item["avatar_url"] as? String,
        //name = item["name"] as? String,
          htmlURL = item["html_url"] as? String {
            let user = User(theLogin: login, theAvatarURL: avatarURL, theHtmlURL: htmlURL, theName: "name")
            users.append(user) 
        }
      } // for loop
    }
    return users
    
  } // usersFromJSONData
}