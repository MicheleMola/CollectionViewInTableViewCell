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
  
  
  var colors: [UIColor] = [] {
    didSet {
      self.collectionView.reloadData()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      layout.sectionInset = UIEdgeInsets(
        top: Constant.offset,    // top
        left: Constant.offset,    // left
        bottom: Constant.offset,    // bottom
        right: Constant.offset     // right
      )
      
      layout.minimumInteritemSpacing = Constant.minItemSpacing
      layout.minimumLineSpacing = Constant.minLineSpacing
    }
    
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func configure(withColors colors: [UIColor]) {
    self.colors = colors
  }
  
}

extension PhotoLibraryCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.colors.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
    cell.backgroundColor = self.colors[indexPath.row]
    return cell
  }
}

extension PhotoLibraryCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let itemWidth = Constant.getItemWidth(boundWidth: collectionView.bounds.size.width)
    
    return CGSize(width: itemWidth, height: itemWidth)
  }
}

