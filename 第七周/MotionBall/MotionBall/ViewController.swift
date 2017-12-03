//
//  ViewController.swift
//  AnimationBall
//
//  Created by 张德茂 on 2017/12/1.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var manager = CMMotionManager()
    lazy var ballView : RollBallView =
        {
            let ballView = RollBallView(frame: view.bounds)
            return ballView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBall()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension ViewController
{
    fileprivate func playBall()
    {
        ballView.backgroundColor = .clear
        view.addSubview(ballView)
        
        manager.deviceMotionUpdateInterval = 1/60
        manager.startDeviceMotionUpdates(to: .main){
            [weak self](motion, error) in
            self?.ballView.accelleration = (motion?.gravity)!
            //开启主队列异步线程，更新球的位置
            DispatchQueue.main.async {
                self?.ballView.updateLocation(multiplier: 5000)
            }
            
        }
    }
    //    private func useGyroPush()
    //    {
    //        //判断陀螺仪是否可用
    //        if manager.isGyroAvailable
    //        {
    //            //设置陀螺仪多久采样一次
    //            manager.gyroUpdateInterval = 0.1
    //            manager.startAccelerometerUpdates(to: .main,withHandler:{
    //                (accelerometerData,error) in
    //                print("x = \(self.manager.accelerometerData?.acceleration.x)","y = \(self.manager.accelerometerData?.acceleration.y)","z = \(self.manager.accelerometerData?.acceleration.z)")
    //            })
    //        }
    //        else{
    //            print("陀螺仪不可用")
    //        }
    //    }
}

