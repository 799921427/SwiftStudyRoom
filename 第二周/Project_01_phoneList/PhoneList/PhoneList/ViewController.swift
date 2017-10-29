//
//  ViewController.swift
//  PhoneList
//
//  Created by 张德茂 on 2017/10/27.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var tableView:UITableView!
    var imageArray:[[String]]?
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        setNavigation()
        setTableView()
        self.view.addSubview(self.tableView)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func initData()
    {
        imageArray = [["1","2","3","4","5","6","7"],["8","9","10","11","12","13","14"]]
    }
    func setNavigation()
    {
        let leftView:UIImageView = UIImageView(frame: CGRect(x:0,y:0,width:30,height:30))
        leftView.image = UIImage(named: "set")
        let leftBarItem = UIBarButtonItem(customView: leftView)
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.navigationItem.rightBarButtonItem = rightBarItem
        self.navigationController?.navigationBar.tintColor = .white
        self.title = "Contacts"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName :UIColor.white]
        self.navigationController?.navigationBar.backgroundColor = UIColor(red:30/255,green:144/255,blue:255/255,alpha:1.0)
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        
    }
    func setTableView()
    {
        self.tableView = UITableView(frame: CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height), style: .plain)
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
       
        let nib = UINib(nibName: "MyTableViewCell", bundle: .main)
        self.tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0)
        {
           return 5
        }
        else if(section == 1)
        {
            return 7 
        }
        else
        {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let initIdentifier = "TableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: initIdentifier) as! MyTableViewCell
        cell.nameLabel.text = "CodeSnail"
        cell.headView.image = UIImage(named: (imageArray?[indexPath.section]as! Array)[indexPath.row])
        //添加照片
        cell.headView?.contentMode = .scaleAspectFill
        cell.headView!.layer.cornerRadius = 20
        cell.headView!.layer.masksToBounds = true
        
        //添加附件
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {return "RECENT"}
        else if(section == 1) {return "FRIENDS"}
        else {return ""}
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var dvc = DetailViewController()
        dvc.imageURL = (imageArray?[indexPath.section]as! Array)[indexPath.row] as String
//        dvc.headViewImage.image = UIImage(named: (imageArray?[indexPath.section]as! Array)[indexPath.row])
        
//        dvc.headViewImage?.contentMode = .scaleAspectFill
//        dvc.headViewImage!.layer.cornerRadius = 45
//        dvc.headViewImage!.layer.masksToBounds = true
        navigationController?.pushViewController(dvc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

