//
//  MyTableViewCell.swift
//  PhoneList
//
//  Created by 张德茂 on 2017/10/28.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var headView: UIImageView!
 
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
