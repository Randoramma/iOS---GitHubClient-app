//
//  ImageFetchService.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/18/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit

class ImageFetchService {
  
  let imageQueue = NSOperationQueue()
  
  func fetchImageForURL(url : String, imageViewSize : CGSize, completionHandler : (UIImage?) -> (Void)) {
    
    self.imageQueue.addOperationWithBlock { () -> Void in
      // try to bring back our image from the URL, it could be a faulty image.
      if let imageData = NSData(contentsOfURL: NSURL(string: url)!) {
        // we have our image.
        let image = UIImage(data: imageData)
        
        let resizedThumbnailImage = ImageResizer.resizeImage(image!, size: imageViewSize)
        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
          completionHandler(image)
        })
      } // if let
    } // addOperationWithBlock
  } // fetchImageForURL
}