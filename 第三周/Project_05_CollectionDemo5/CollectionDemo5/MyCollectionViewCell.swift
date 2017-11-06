//
//  MyCollectionViewCell.swift
//  CollectionDemo5
//
//  Created by 张德茂 on 2017/11/5.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    var imgURL : String = ""
    {
        didSet
        {
            updateUI()
        }
    }
    func updateUI()
    {
        imgView.image = UIImage(named:imgURL)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.layer.cornerRadius = 5
        imgView.layer.masksToBounds = true
    }

}
