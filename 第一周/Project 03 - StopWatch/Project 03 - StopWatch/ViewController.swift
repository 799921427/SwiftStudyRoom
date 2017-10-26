//
//  ViewController.swift
//  Project 03 - StopWatch
//
//  Created by 张德茂 on 2017/10/20.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resetBtn:UIButton?
    var beginBtn:UIButton?
    var stopBtn:UIButton?
    var showLabel:UILabel?
    var myTimer:Timer?
    var count:Double?
    override func viewDidLoad() {
        super.viewDidLoad()
        let screen = self.view.frame.size
        
        createTimer()
        count = 0.0;
        self.view.backgroundColor = .black
        resetBtn = UIButton(frame:CGRect(x: screen.width*6/7, y: 25, width:45, height:15))
        resetBtn?.setTitle("Reset", for: .normal)
        resetBtn?.titleLabel?.adjustsFontSizeToFitWidth = true
        resetBtn?.setTitleColor(.white, for: .normal)
        resetBtn?.addTarget(self, action: #selector(resetTime(sender:)), for: .touchUpInside)
        
        
        self.view.addSubview(resetBtn!)
        
        showLabel = UILabel(frame: CGRect(x: screen.width/7, y: 60, width: screen.width*5/7, height: 150))
        showLabel?.text = "0.0"
        showLabel?.textColor = .white
        showLabel?.font = UIFont(name: "Helvetica", size: 80.0)
        showLabel?.textAlignment = .center
        self.view.addSubview(showLabel!)
            
        beginBtn = UIButton(frame:CGRect(x: 0, y: 250, width: screen.width/2, height: screen.height-230))
        beginBtn?.backgroundColor = UIColor(red:123/255.0 , green: 104/255.0, blue: 238/255.0, alpha: 1.0)
        var startImg = UIImageView(image:UIImage(named: "start.png"))
        startImg.frame = CGRect(x: beginBtn!.frame.size.width/2-25, y: beginBtn!.frame.size.height/2-25 , width: 50.0, height: 50.0)
        beginBtn?.addTarget(self, action: #selector(beginTime(sender:)), for: .touchUpInside)
       
        beginBtn?.addSubview(startImg)
        self.view.addSubview(beginBtn!)
        
        stopBtn = UIButton(frame:CGRect(x: screen.width/2, y: 250, width: screen.width/2, height: screen.height-230))
        stopBtn?.backgroundColor = .green
        var stopImg = UIImageView(image:UIImage(named: "stop.png"))
        stopImg.frame = CGRect(x: stopBtn!.frame.size.width/2-25, y: stopBtn!.frame.size.height/2-25 , width: 50.0, height: 50.0)
        stopBtn?.addTarget(self, action: #selector(stopTime), for: .touchUpInside)
        stopBtn?.addSubview(stopImg)
        self.view.addSubview(stopBtn!)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func createTimer()
    {
        //添加计时器
        myTimer = Timer.init(timeInterval: 0.1, target: self, selector:#selector(ViewController.countdown),  userInfo: nil, repeats: true)
        RunLoop.current.add(myTimer!, forMode: .commonModes)
        self.stopTime()    }
    
    func countdown()
    {
        self.count = self.count! + Double(0.1)
        self.showLabel?.text = NSString(format:"%.1lf",self.count!) as String
        
    }
    func resetTime(sender:UIButton)
    {
        if (self.myTimer != nil)
        {
            if (self.myTimer?.isValid)!
            {
                self.myTimer?.invalidate();
                self.myTimer = nil;
            }
        }
        self.showLabel?.text = String("0.0")
        self.count = 0;
    }
    
    func beginTime(sender:UIButton)
    {
        if(self.myTimer == nil)
        {
            self.createTimer()
        }
        self.myTimer?.fireDate = .distantPast
    }
    
    func stopTime()
    {
        self.myTimer?.fireDate = NSDate.distantFuture;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
