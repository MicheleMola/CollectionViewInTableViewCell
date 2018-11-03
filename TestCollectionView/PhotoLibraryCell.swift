//
//  photoLibraryCell.swift
//  TestCollectionView
//
//  Created by Michele Mola on 11/2/18.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit

class PhotoLibraryCell: UITableViewCell {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

extension PhotoLibraryCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
    return cell
  }
}

extension PhotoLibraryCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    //let itemWidth = Constant.getItemWidth(boundWidth: collectionView.bounds.size.width)
    let width = (collectionView.bounds.size.width / 3) - 8
    
    return CGSize(width: width, height: width)
  }
}
