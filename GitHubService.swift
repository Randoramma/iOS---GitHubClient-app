//
//  GitHubService.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/15/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import Foundation

/*

Class containing all code relating to querying a github repos for.

*/
class GitHubService {
  
  
  // found on the github page https://developer.github.com/v3/search/#search-repositories
  // URL request must be copied accurately...
  let gitHubSearchRepoURL = "https://api.github.com/search/repositories"
  
  // function creating the search request for a remote repository
  func fetchReposForSearch (searchTerm : String, completionHandler : ([Repository]?, String?) -> (Void)) {
    
    
    // construct query string
    let queryString = "?q=\(searchTerm)"
    // construct query string
    let requestURL = gitHubSearchRepoURL + queryString
    // converts the string representation to a NSURL object
    let url = NSURL(string: requestURL)
    // sets the NSURL to a request optional ready for searching a repos.
    let request = NSURLRequest(URL: url!)
    
    // URL session is either using a delegate or closures.  We are not using a delegate so we need something to recieve the data.
    let dataTask = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (theData, theResponse, theError) -> Void in
      // this is our call back...
      
      // to get the status of the response as a URL, we must cast it as an HTTP Response:
      if let httpResponse = theResponse as? NSHTTPURLResponse {
        // this will work with regular HTTP API's
        if httpResponse.statusCode == 200 {
          
          let repos = ReposJSONParser.ReposFromJSONData(theData)
          
          NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
            completionHandler(repos, nil)
          })

          
          
        }
        
        /*
        We now are communicating with GitHub's servers.  We generate the request, their server recieves the URL, parses it up and sends back a response based on this request between the ? and the end of the request.
        */
        
      } // NSHTTPURLResponse
      
    }) // NSURLSession.sharedSession()
    // fires the request for data off.
    dataTask.resume()
  } // fetchReposForSearch
}
