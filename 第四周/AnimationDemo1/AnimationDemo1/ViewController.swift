//
//  ViewController.swift
//  AnimationDemo1
//
//  Created by 张德茂 on 2017/11/8.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //懒加载
    //设置秒针
    lazy var secondPointView : UIView = {
        let secondPointView = UIView()
        secondPointView.backgroundColor = .red
        secondPointView.bounds = CGRect(x: 0, y: 0, width: 1, height: 60)
        //修改锚点
        secondPointView.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        return secondPointView
    }()
    //设置分针
    lazy var minutePointView : UIView = {
        let minutePointView = UIView()
        minutePointView.backgroundColor = .darkGray
        minutePointView.bounds = CGRect(x: 0, y: 0, width: 3, height: 50)
        //修改锚点
        minutePointView.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        return minutePointView
    }()
    //设置时针
    lazy var hourPointView : UIView = {
        let hourPointView = UIView()
        hourPointView.backgroundColor = .black
        hourPointView.bounds = CGRect(x: 0, y: 0, width: 5, height: 40)
        //修改锚点
        hourPointView.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        return hourPointView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
        let link = CADisplayLink(target: self, selector: #selector(clockRunning))
        link.add(to: RunLoop.main, forMode: .defaultRunLoopMode)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func clockRunning()
    {
        let tZone = NSTimeZone.local
        var calendar = NSCalendar.current
        let currentDate = Date()
        calendar.timeZone = tZone
        let currentTime = calendar.dateComponents([Calendar.Component.hour,Calendar.Component.minute,Calendar.Component.second], from: currentDate)
        let angle = Double(currentTime.second!) * (Double.pi*2.0/60)
        
        secondPointView.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        
        let minuteAngle = Double(currentTime.minute!) * (Double.pi*2.0/60)
        
        minutePointView.transform = CGAffineTransform(rotationAngle:CGFloat(minuteAngle))
        
        let hourAngle = Double(currentTime.hour!) * (Double.pi*20/12)
        hourPointView.transform = CGAffineTransform(rotationAngle:CGFloat(hourAngle))
        
    }
    func setupLayer()
    {
        let myLayer = CALayer()
        myLayer.bounds = CGRect(x: 0, y: 0, width: 150, height: 150)
        myLayer.position = self.view.center
        myLayer.contents = UIImage(named:"clock")?.cgImage
        self.view.layer.addSublayer(myLayer)
        
        //设置秒针，添加到view中
        secondPointView.center = view.center
        view.addSubview(secondPointView)
        //设置分针，添加到view中
        minutePointView.center = view.center
        view.addSubview(minutePointView)
        //设置时针，添加到view中
        hourPointView.center = view.center
        view.addSubview(hourPointView)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


