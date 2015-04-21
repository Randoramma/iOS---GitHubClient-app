//
//  StringExtensions.swift
//  GitHubToGoRM
//
//  Created by Randy McLain on 4/20/15.
//  Copyright (c) 2015 Randy McLain. All rights reserved.
//

import UIKit


extension String {
  
  static func shake(viewToShake: UIView)
  {
    let duration = 0.25
    UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 10.0, options: UIViewAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
      viewToShake.transform = CGAffineTransformMakeTranslation(3, 0);
      },
      completion: {(finished) -> Void in
        viewToShake.transform = CGAffineTransformMakeTranslation(0, 0);
    })
  }
  
  func validCharacterURL()-> Bool {
    
    let elements = count(self)
    let theRange = NSMakeRange(0,elements)
    let regex = NSRegularExpression(pattern: "[^0-9a-zA-Z\n]", options: nil, error: nil)
    let matches = regex?.numberOfMatchesInString(self, options: nil, range: theRange)
    
    if matches > 0 {
      return false
    }
    
    return true
    
  }
}


