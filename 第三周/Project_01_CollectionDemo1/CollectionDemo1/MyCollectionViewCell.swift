//
//  MyCollectionViewCell.swift
//  CollectionDemo1
//
//  Created by 张德茂 on 2017/11/3.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numLabel: UILabel!
    
    var num:String = ""{
    didSet{
        updateUI()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    func updateUI()
    {
        numLabel.text = num
    }
}
