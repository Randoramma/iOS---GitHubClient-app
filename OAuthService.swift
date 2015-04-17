//
//  OAuthService.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/16/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class OAuthService {
  
  var oAuthCompletionHandler : (() -> ())?
  
  // passes in the http address for us to go to for github authentication.
  func requestOAuth (completionHandler : () -> ()) {
    // create oAuth completion handler property to be retained until the oAuth process is completed whereby we will then execute the completion handler.
    self.oAuthCompletionHandler = completionHandler
    // the initial part of URL for Web OAuth :https://developer.github.com/v3/oauth/#web-application-flow
    let myInitialOAuthURL = "https://github.com/login/oauth/authorize?client_id=\(myClientID)&scope=user,public_repo"
    
    UIApplication.sharedApplication().openURL(NSURL(string: myInitialOAuthURL)!)
  } // requestOAuth
  
  
  func handleRedirect(url : NSURL) {
    // this gives us our "code" to exchange for an access token
    let code = url.query
    
    
    let url = "https://github.com/login/oauth/access_token?\(code!)&client_id=\(myClientID)&client_secret=\(myClientSecretKey)&access_token=\(myClientToken)"
    
    // we made this a mutuable url request because we are making it a post and we needed to customize the request.
    let request = NSMutableURLRequest(URL: NSURL(string: url)!)
    request.HTTPMethod = "POST"
    
    // adding an accept header method which will tell github server what type of data we want returned to the client.
    // Accept: application/json
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    
    // send out the request we just made in the handler function.
    let dataTask = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (theData, theResponse, theError) -> Void in
      
      if theError == nil {
        //println(theResponse)
        // begin to parse our return into a usable token object which we can append to each future server request.
        if let jsonDictionary = NSJSONSerialization.JSONObjectWithData(theData, options: nil, error: nil) as? [String: AnyObject] {
          let theToken = jsonDictionary["access_token"] as! String
          // save the token in the User defaults. 
          NSUserDefaults.standardUserDefaults().setObject(theToken, forKey: "gitHubToken")
          // make sure the token is saved.
          NSUserDefaults.standardUserDefaults().synchronize()
          
          NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
            self.oAuthCompletionHandler!()
          })
           println(theToken)
        } // NSJSONSerialization.JSONObjectWithData
      } // if no error
    }) // completion handler
    dataTask.resume()
  } // handleRedirect
}