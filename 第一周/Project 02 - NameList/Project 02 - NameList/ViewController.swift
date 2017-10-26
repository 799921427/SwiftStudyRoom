//
//  ViewController.swift
//  Project 02 - NameList
//
//  Created by 张德茂 on 2017/10/19.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

  
    var titleArray:[String]!
    //定义通讯录字典
    var nameList : [String:Array<String>]{
        let dic = ["A":["Abc","Abord","Anum"],"B":["Back","Black","Blue"],"C":["Cack","Clack","Clue"],"D":["Dack","Dlack","Dlue"],"E":["Eack","Elack","Elue"],"J":["Jack","Jlack","Jlue"],"Z":["Zack","Zlack","Zlue","Zoe"]]
        num = dic.count
        
        
        titleArray = ["A","B","C","D","E","J","Z"];
        return dic
    }
    
    
   
    
   
    //右部导航
    var searchView:UIView?
    //右部导航按钮高度
    var buttonSizeHeight = 25
    var num :Int!
    let searchViewWidthRadio:Double = 1.0/6
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
     
        self.navigationController?.navigationBar.barTintColor =
            .white
        self.title = "Names"
      //  self.navigationController?.navigationBar.layer.masksToBounds = true
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
       // self.automaticallyAdjustsScrollViewInsets = false
        
       // let tableView = UITableView()
     //   tableView.frame = self.view.bounds
     //   self.view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        
        createRightView();
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createRightView(){
        let nameListKeyArray = Array(nameList.keys)
        
        var sizeHeigt = buttonSizeHeight*num;
        searchView = UIView()
        
        let x = Double(self.view.frame.size.width)*(1.0-searchViewWidthRadio)
        let y = (Double(self.view.frame.size.height)-Double(sizeHeigt))/2.0
        let width = Double(self.view.frame.size.width)*searchViewWidthRadio
        let hight = Double(sizeHeigt)
        searchView?.frame = CGRect(x: x, y:y , width: width, height: hight)
        self.view.addSubview(searchView!)
        searchView?.backgroundColor = .clear
        
        createButton();
        
    }
    
    func createButton(){
        
        for index in 0..<num
        {
            let button = UIButton()
            button.tag = 1000 + index
            button.setTitle(titleArray[index], for: .normal)
            button.setTitleColor(UIColor.blue, for: .normal )
            
            button.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
            searchView?.addSubview(button)
            let x = 0.0
            let y = Double(index*buttonSizeHeight)
            let width = Double(self.view.frame.size.width)*searchViewWidthRadio
            let hight = Double(buttonSizeHeight)-2.0
            button.frame = CGRect(x: x, y:y , width: width, height: hight)
            
        }
        
    }
    func btnClick(sender:UIButton?)
    {
        let tag = Float((sender?.tag)! - 1000)
        let section = NSIndexPath(row: 0, section: Int(tag))
        self.tableView.scrollToRow(at: section as IndexPath, at: .top, animated:true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableCell")
        var array1 = nameList[self.titleArray[indexPath.section]]
        
        cell?.textLabel?.text = array1?[indexPath.row];
    
       //print((cell?.textLabel?.text)!)
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList[titleArray[section]]!.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleArray[section];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

