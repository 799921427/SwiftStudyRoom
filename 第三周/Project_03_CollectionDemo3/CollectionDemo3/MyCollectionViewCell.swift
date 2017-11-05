//
//  MyCollectionViewCell.swift
//  CollectionDemo3
//
//  Created by 张德茂 on 2017/11/5.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
 
    
   
    
    override func layoutSubviews() {
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
    }
}
