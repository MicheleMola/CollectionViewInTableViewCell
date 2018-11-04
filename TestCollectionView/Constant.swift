//
//  Constant.swift
//  TestCollectionView
//
//  Created by Michele Mola on 03/11/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//


import UIKit

class Constant {

  static let column: CGFloat = 3
  
  static let minLineSpacing: CGFloat = 1.0
  static let minItemSpacing: CGFloat = 1.0
  
  static let offset: CGFloat = 1.0 // TODO: for each side, define its offset
  
  static func getItemWidth(boundWidth: CGFloat) -> CGFloat {
    
    let totalWidth = boundWidth - (offset + offset) - ((column - 1) * minItemSpacing)
    
    return totalWidth / column
  }
}
