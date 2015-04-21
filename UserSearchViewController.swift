//
//  UserSearchViewController.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/17/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate, UINavigationControllerDelegate {
  
  // properties
  @IBOutlet weak var myUserSearchBar: UISearchBar!
  @IBOutlet weak var myUserCollectionView: UICollectionView!
  var users = [User]()
  let imageFetchService = ImageFetchService()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.myUserCollectionView.dataSource = self
    self.myUserSearchBar.delegate = self
    
  } // viewDidLoad
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    // become delegate of nav controller.
    self.navigationController?.delegate = self
  } // viewWillAppear
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    // remove the relationship of out view controller to self so when leaving we are no longer the delegate.
    self.navigationController?.delegate = nil
  } // viewWillDisappear
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    myUserSearchBar.resignFirstResponder()
    GitHubService.sharedGithubInstance.fetchUsersForSearch(myUserSearchBar.text, completionHandler: { (users, error) -> (Void) in
      
      self.users = users!
      self.myUserCollectionView.reloadData()
    })
  } // searchBarSearchButtonClicked
  
  func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
    
    return text.validCharacterURL()
  } // shouldChangeTextInRange
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return self.users.count
  } // numberOfItemsInSection
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let theCell = collectionView.dequeueReusableCellWithReuseIdentifier("myUserSearchCell", forIndexPath: indexPath) as! UserCell
    // grab the user from the array boild in the search bar clicked...
    theCell.myUserImageView.image = nil
    let user = self.users[indexPath.row]
    // if the user already has an image, set it.
    if user.avatarImage != nil {
      theCell.myUserImageView.image = user.avatarImage
    } else {
      // download the image
      self.imageFetchService.fetchImageForURL(user.avatarURL, imageViewSize : theCell.myUserImageView.frame.size,    completionHandler: { (downloadedImage) -> (Void) in
        theCell.myUserImageView.alpha = 0
        theCell.myUserImageView.transform = CGAffineTransformMakeScale(1.4, 1.4)
        user.avatarImage = downloadedImage
        theCell.myUserImageView.image = downloadedImage
        UIView.animateWithDuration(0.4, animations: { () -> Void in
          theCell.myUserImageView.alpha = 1
          theCell.myUserImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
        })
      })
    }
    return theCell
  } // cellForItemAtIndexPath
  
  func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    if toVC is UserDetailViewController {
      
      return ToUserDetailAnimationController()
      
    } else {
    return nil
    }
  } // animationControllerForOperation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showUserToUserDetail" {
      
      let destination = segue.destinationViewController as! UserDetailViewController
      let indexPath = self.myUserCollectionView.indexPathsForSelectedItems().first! as! NSIndexPath
      let user = self.users[indexPath.row]
      destination.mySelectedUser = user
    }
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  } // didReceiveMemoryWarning
}
