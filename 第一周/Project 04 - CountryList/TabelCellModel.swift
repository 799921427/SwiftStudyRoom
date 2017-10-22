//
//  TabelCellModel.swift
//  Project 04 - CountryList
//
//  Created by 张德茂 on 2017/10/22.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class TabelCellModel: NSObject {
    
    var level:Int?
    var name:String?
    var subItems:NSMutableArray?
    var dev_id:String?
    var isOpen:Bool?
        
    override init()
    {
        super.init()
        self.isOpen = false
        self.subItems = NSMutableArray.init()
    }

}
