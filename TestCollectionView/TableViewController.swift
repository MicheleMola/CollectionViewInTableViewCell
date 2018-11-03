//
//  TableViewController.swift
//  TestCollectionView
//
//  Created by Michele Mola on 11/2/18.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
  }

}

// UITableViewDelegate
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
      
    default:
      return UITableView.automaticDimension
    }
  }
}
