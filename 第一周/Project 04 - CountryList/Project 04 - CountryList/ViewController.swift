//
//  ViewController.swift
//  Project 04 - CountryList
//
//  Created by 张德茂 on 2017/10/21.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    lazy var tableView:UITableView =
    {
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableModelCell.self, forCellReuseIdentifier: "tableViewCell")
        return tableView
    
    }()
    var dataArr :   Array<Any>?
    var configDataArr :   Array<Any>?
    var arr1 :  Array<Any>?
    var arr2 :  Array<Any>?
    var arr3 :  Array<Any>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        initArr()
        
        //创建数据
        let dic = createDic()
        self.dataArr = translate(dic: dic ,level:1, dataArr:self.dataArr!)
        reloadTableViewDataAndConfig()
        
        self.view.addSubview(self.tableView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func initArr()
    {
        arr1 =  ["亚洲","南美洲","澳洲"]
        arr2 = [["中国","俄罗斯"],["巴西","阿根廷"],["澳大利亚","新西兰"]]
        arr3 =  [["北京","上海","深圳","广州"],["莫希科","新西伯利亚"],[""]]
        self.dataArr =   [Any]()
        self.configDataArr =   [Any]()
    }
    func createDic()-> [String:Any]
    {
        var cnt:Int
        cnt = 0
        var sumDic =   [String:Any]()
        var dataArr = [[String:Any]]()
        for i in 0...2
        {
            
            var dic1 =   [String:Any]()
            dic1["name"] = String(describing: arr1?[i] as! String)
            
            var dataArr2 =   [Any]()
            let cnt2 = Int((arr2?[i] as! [Any] ).count)
      
            for j in 0..<cnt2
            {
                var dic2 =   [String:Any]()
                dic2["name"] = String(describing: (arr2?[i] as!  [Any])[j])
                
                var dataArr3 =  [Any]()
                if(!(cnt == arr3?.count))
                {
                    var cnt3 = Int((arr3?[cnt] as!  [Any]).count)
                
                    for k in 0..<cnt3
                    {
                                                var dic3 =   [String:Any]()
                        dic3["name"] = String(describing: (arr3?[cnt] as!  Array<Any>)[k])
                        dataArr3.append(dic3 as! [String:String])
                    }
                    
                    cnt = cnt+1
                }
                    dic2["subItems"] = dataArr3
                    dataArr2.append(dic2)
                
            }
            dic1["subItems"] = dataArr2
            dataArr.append(dic1)
            
            
        }
        sumDic["subItems"] = dataArr
        print(sumDic)
        return sumDic;
    }
    
    func translate(dic:[String:Any],level:Int, dataArr: [Any]) -> [Any]
    {
        if level == 4
        {
            return [Any]()
        }
        
        var dataArr = dataArr
    
        let arr = dic["subItems"] as! [Any]
      
        
            for subDic in arr
            {
                var subdic = subDic as! [String:Any]
                let model = TabelCellModel()
                model.name = subdic["name"] as! String
                model.level = level
               
                model.subItems = translate(dic: subdic, level: level+1, dataArr: model.subItems as! [Any])
                 dataArr.append(model)
            }
        return dataArr;
        
        
        
    }
    func depthFirstUpdataTableViewDataWithItemArr(ItemArr:[Any])
    {
        if(ItemArr.count>0)
        {
            for  model in ItemArr
            {
                let model2 = model as! TabelCellModel
                self.configDataArr?.append(model)
                if((model2.subItems != nil) && model2.isOpen! == true)
                {
                    print(model2.name)
                    print(model2.subItems)
                    depthFirstUpdataTableViewDataWithItemArr(ItemArr: (model as AnyObject).subItems as! [Any])
                }
            }
        }
    }
    func reloadTableViewDataAndConfig()
    {
        self.configDataArr?.removeAll()
        depthFirstUpdataTableViewDataWithItemArr(ItemArr: self.dataArr!)
        self.tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        print(self.configDataArr!.count)
        return self.configDataArr!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as? TableModelCell
        cell?.levelModel = self.configDataArr![indexPath.row] as? TabelCellModel
        //cell?.setLevelModel()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let levelModel = self.configDataArr![indexPath.row] as? TabelCellModel
        if((levelModel?.subItems?.count) != nil)
        {
            levelModel?.isOpen = !(levelModel?.isOpen)!
            reloadTableViewDataAndConfig()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

