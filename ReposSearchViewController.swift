//
//  ReposSearchViewController.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/15/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class ReposSearchViewController: UIViewController {

    let myGitHubService = GitHubService()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.myGitHubService.fetchReposForSearch("Swift", completionHandler: { (repos, error) -> (Void) in
        // if we get 
        if repos != nil {
         // println(repos!.count)
        }
      }) // fetchReposForSearch

        // Do any additional setup after loading the view.
    } // viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // didReceiveMemoryWarning
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
