//
//  ReposSearchViewController.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/15/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class ReposSearchViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

  @IBOutlet weak var mySearchBar: UISearchBar!
  
  @IBOutlet weak var mySearchTableView: UITableView!
  
  let myGitHubService = GitHubService()
 
  var myResults = [Repository]()
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.mySearchTableView.dataSource = self
      self.mySearchBar.delegate = self
      
    } // viewDidLoad

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.myResults.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("SearchTableCell", forIndexPath: indexPath) as! UITableViewCell
    
    let theRepo = self.myResults[indexPath.row]
    cell.textLabel?.text = theRepo.name
    return cell
  }
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    
    mySearchBar.resignFirstResponder()
    
    self.myGitHubService.fetchReposForSearch(mySearchBar.text, completionHandler: { (repos, error) -> (Void) in
      // if we get
      if repos != nil {
        //println(repos!.count)
        self.myResults = repos!
        self.mySearchTableView.reloadData()
      }
    }) // fetchReposForSearch
  }
  
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } // didReceiveMemoryWarning


}
