//
//  UserSearchViewController.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/17/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate {

  @IBOutlet weak var myUserSearchBar: UISearchBar!
  
  @IBOutlet weak var myUserCollectionView: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.myUserCollectionView.dataSource = self
      
      self.myUserSearchBar.delegate = self

    } // viewDidLoad

  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return 100
  } // numberOfItemsInSection
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let theCell = collectionView.dequeueReusableCellWithReuseIdentifier("myUserSearchCell", forIndexPath: indexPath) as! UICollectionViewCell
    
    
    return theCell
  } // cellForItemAtIndexPath
    
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  } // didReceiveMemoryWarning

}
