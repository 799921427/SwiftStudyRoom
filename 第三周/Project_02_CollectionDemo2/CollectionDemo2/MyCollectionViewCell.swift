//
//  MyCollectionViewCell.swift
//  CollectionDemo2
//
//  Created by 张德茂 on 2017/11/4.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    var imageURL:String = "" {
        didSet{
            updateUI()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
    }



    func updateUI()
    {
        imageView.image = UIImage(named: imageURL)
    }
}
