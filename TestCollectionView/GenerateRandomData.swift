//
//  GenerateRandomData.swift
//  TestCollectionView
//
//  Created by Michele Mola on 03/11/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class GenerateRandomData {
  class func generate() -> [UIColor] {
    let numberOfElements = 30
    var colors = [UIColor]()
    
    for _ in 0..<numberOfElements {
      colors.append(UIColor.randomColor())
    }
    
    return colors
  }
}


extension UIColor {
  class func randomColor() -> UIColor {
    
    let hue = CGFloat(arc4random() % 100) / 100
    let saturation = CGFloat(arc4random() % 100) / 100
    let brightness = CGFloat(arc4random() % 100) / 100
    
    return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
  }
}
