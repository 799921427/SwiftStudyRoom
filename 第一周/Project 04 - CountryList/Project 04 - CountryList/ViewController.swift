//
//  ViewController.swift
//  Project 04 - CountryList
//
//  Created by 张德茂 on 2017/10/21.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableView : UITableView?
    var dataArr : NSMutableArray?
    var configDataArr : NSMutableArray?
    var arr1 : NSArray?
    var arr2 : NSArray?
    var arr3 : NSArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView!)
        self.dataArr = NSMutableArray.init()
        self.configDataArr = NSMutableArray.init()
        initArr()
        
        //创建数据
        var dic : NSDictionary = createDic()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func initArr()
    {
        arr1 = NSArray(array: ["亚洲","南美洲","澳洲"])
        arr2 = NSArray(array: [["中国","俄罗斯"],["巴西","阿根廷"],["澳大利亚","新西兰"]])
        arr3 = NSArray(array: [["北京","上海","深圳","广州"],["莫希科","新西伯利亚"]])
    }
    func createDic()
    {
        var sumDic:NSDictionary = NSDictionary.init()
        var dataArr:NSMutableArray = NSMutableArray.init()
        for i in 0...2
        {
            var dic1 = NSMutableDictionary.init()
            dic1["name"] = String(describing: arr1?[i])
            dataArr.add(dic1)
            var dataArr2 = NSMutableArray.init()
        
            for j in 0...2
            {
                var dic2 = NSMutableDictionary.init()
                dic2["name"] = String(describing: (arr2?[i] as! NSArray)[j])
                dataArr2.add(dic2)
                if(j<2)
                {
                    var dataArr3 = NSMutableArray.init()
                    
                    dic1["name"] = String(describing: arr1?[i])
                    dataArr3.add(dic1)

                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

