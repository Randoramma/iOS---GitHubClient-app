//
//  Repository.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/15/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import Foundation

struct Repository {
  
  
  var name : String
  var author : String
  var htmlUrl : String
  var description : String
  
  
  init ( theName : String, theAuthor : String, theUrl : String, theDescription : String) {
    
    name = theName
    author = theAuthor
    htmlUrl = theUrl
    description = theDescription
    
  }
  
  
  
  
}
