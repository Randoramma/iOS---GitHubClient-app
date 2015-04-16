//
//  ReposJSONParser.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/15/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import Foundation

class ReposJSONParser {
  
  // convert data to dictionary and then parse out "items" (owners name, authors name, HTML URL, Description,
  class func ReposFromJSONData (jsonData : NSData) -> [Repository] {
    
    // create a var to handle the errors that may occur when unwrapping our NSData JSON object.
    var jsonError : NSError?
    
    var repos = [Repository]()
    
    if let rootDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &jsonError) as? [String: AnyObject] {
      if let reposArray  = rootDictionary ["items"] as? [[String : AnyObject]] {
        
        for reposDictionary in reposArray {
          if let
            name = reposDictionary["name"] as? String,
            ownerDictionary = reposDictionary["owner"] as? [String : AnyObject],
            author = ownerDictionary["login"] as? String,
            htmlUrl = reposDictionary["html_url"] as? String,
            description = reposDictionary["description"] as? String {
              
              let theParsedRepositoryObject = Repository(theName: name, theAuthor: author, theUrl: htmlUrl, theDescription: description)
              
              repos.append(theParsedRepositoryObject)
          } // if let
        }
      } // for loop
    } // JSON Parsing
    return repos
  } // ReposFromJSONData
}