//
//  ViewController.swift
//  AnimationDemo2
//
//  Created by 张德茂 on 2017/11/11.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate {
    let leftEye = UIView()
    let rightEye = UIView()
    let centerView = UIView()
    let noteLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEye()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //触碰之后触发动画
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //阻尼运动
        UIView.animate(withDuration:0.1, delay:0, usingSpringWithDamping:0.8,initialSpringVelocity:0.8, options:UIViewAnimationOptions(),animations:{
            self.leftEye.center.x = self.leftEye.center.x + 35
            self.leftEye.center.y = self.leftEye.center.y+7
            
            self.rightEye.center.x = self.rightEye.center.x - 35
            self.rightEye.center.y = self.rightEye.center.y+7
            
            self.centerView.frame.size.height = 150
            self.centerView.center.y = self.centerView.center.y + 30
            self.view.layoutIfNeeded()
        },completion:{ (result) in
            if result{
                UIView.animate(withDuration:0.1,delay:0,usingSpringWithDamping:0.8,initialSpringVelocity:0.8,options:UIViewAnimationOptions(),animations:{
                    self.leftEye.center.x = self.leftEye.center.x - 35
                    self.leftEye.center.y = self.leftEye.center.y+7
                    
                    self.leftEye.backgroundColor = UIColor(red: 0/255.0, green: 204/255.0, blue: 153/255.0, alpha: 0.8)
                    self.rightEye.center.x = self.rightEye.center.x + 35
                    self.rightEye.center.y = self.rightEye.center.y+7
                    self.rightEye.backgroundColor = UIColor(red: 204/255.0, green: 0/255.0, blue: 153/255.0, alpha: 0.8)
                    self.noteLabel.isHidden = false
                })
            }
            
        })
        
    }
    func setupEye()
    {
        
        let kScreenW = self.view.frame.size.width
        noteLabel.frame = CGRect(x: kScreenW/2 - 70, y: 40, width: 140, height: 30)
        noteLabel.isHidden = true
        noteLabel.textAlignment = .center
        noteLabel.text = "吓死宝宝了！"
        noteLabel.adjustsFontSizeToFitWidth = true
        leftEye.center = CGPoint(x: 70, y: 150)
        leftEye.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        leftEye.backgroundColor = UIColor(red: 204/255.0, green: 0/255.0, blue: 153/255.0, alpha: 0.8)
        
        
        rightEye.center = CGPoint(x: kScreenW-70, y: 150)
        rightEye.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        rightEye.backgroundColor = UIColor(red: 0/255.0, green: 204/255.0, blue: 153/255.0, alpha: 0.8)
        
        
        let centerWidth = kScreenW - 200 - 40
        centerView.center = CGPoint(x: 120+centerWidth / 2, y: 230)
        centerView.bounds = CGRect(x: 0, y: 0, width: kScreenW - 200 - 40, height: 30)
        centerView.backgroundColor = .gray
        
        self.view.addSubview(noteLabel)
        self.view.addSubview(leftEye)
        self.view.addSubview(rightEye)
        self.view.addSubview(centerView)
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

