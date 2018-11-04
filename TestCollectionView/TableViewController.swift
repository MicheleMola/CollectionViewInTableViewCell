//
//  TableViewController.swift
//  TestCollectionView
//
//  Created by Michele Mola on 11/2/18.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  
  var colors: [UIColor] = [] {
    didSet {
      self.tableView.reloadData()
    }
  }
  
  let activityIndicator = UIActivityIndicatorView(style: .gray)
  
  var isLoading = false
  var yContentOffset: CGFloat = 0.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    getPhotos()
    setupActivityIndicator()
  }
  
  func getPhotos() {
    let colors = GenerateRandomData.generate()
    self.colors.append(contentsOf: colors)
  }
  
  func setupActivityIndicator() {
    activityIndicator.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
    
    self.tableView.tableFooterView = activityIndicator
  }

}

// UITableViewDataSource
extension TableViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath)
      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath) as! PhotoLibraryCell
      cell.configure(withColors: self.colors)
      return cell
    }
  }
}

// UITableViewDelegate
extension TableViewController {
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.row {
    case 0:
      return 150
    case 1:
      let itemHeight = Constant.getItemWidth(boundWidth: tableView.bounds.size.width)
      
      let totalItem = CGFloat(self.colors.count)
      let totalRow = ceil(totalItem / Constant.column)
      
      let totalTopBottomOffset = Constant.offset + Constant.offset
      
      let totalSpacing = (totalRow - 1) * Constant.minLineSpacing
      
      let totalHeight  = ((itemHeight * CGFloat(totalRow)) + totalTopBottomOffset + totalSpacing)

      return totalHeight
    default:
      return UITableView.automaticDimension
    }
  }
  
}

extension TableViewController {
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let isReachingEnd = scrollView.contentOffset.y >= 0
      && scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)
    if isReachingEnd && !isLoading {
      print("bottom")
    }
  }
  
}
