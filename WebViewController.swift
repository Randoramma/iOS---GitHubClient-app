//
//  WebViewController.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/19/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit
import WebKit


class WebViewController: UIViewController {

  var myWebView: WKWebView!
  
  var mySelectedRepo : Repository!

    override func viewDidLoad() {
        super.viewDidLoad()
      let urlRequest = NSURLRequest(URL: NSURL(string: mySelectedRepo.htmlUrl)!)
      
      self.myWebView = WKWebView(frame: self.view.frame)
      self.view.addSubview(myWebView)
      self.myWebView.loadRequest(urlRequest)
      
      // webView.loadRequest(<#request: NSURLRequest#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
