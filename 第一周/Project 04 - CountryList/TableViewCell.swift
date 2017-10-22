//
//  TableViewCell.swift
//  Project 04 - CountryList
//
//  Created by 张德茂 on 2017/10/22.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var levelModel:TabelCellModel?
    var nameLabel:UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.nameLabel = UILabel.init()
        self.contentView.addSubview(self.nameLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLevelModel(levelModel:TabelCellModel)
    {
        self.levelModel = levelModel
        var nameX = Float(0)
        let nameY = Float(0)
        let nameW = Float(100)
        let nameH = Float(44)
        if(levelModel.level==1)
        {
            nameX = 20
        }
        else if(levelModel.level!==2)
        {
            nameX = 40
        }
        self.nameLabel?.frame = CGRect(x:CGFloat(nameX), y:CGFloat(nameY), width:CGFloat(nameW), height:CGFloat(nameH))
        self.nameLabel?.text = levelModel.name!
        
     }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
