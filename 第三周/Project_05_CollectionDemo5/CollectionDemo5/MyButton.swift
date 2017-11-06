//
//  MyButton.swift
//  CollectionDemo5
//
//  Created by 张德茂 on 2017/11/5.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class MyButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var bImageView : UIImageView!
    
    var bImage:UIImage!{
        didSet
        {
            bImageView.image = bImage
        }
    }
    override init(frame:CGRect)
    {
        super.init(frame: frame)
        bImageView = UIImageView(frame: bounds)
        addSubview(bImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bImageView.frame = bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
