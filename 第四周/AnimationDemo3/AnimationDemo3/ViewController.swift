//
//  ViewController.swift
//  AnimationDemo3
//
//  Created by 张德茂 on 2017/11/11.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let heartLayer = CALayer()
    let beatyLayer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
        heartLayer.add(createHeartAnimation(), forKey: nil)
        beatyLayer.add(createBeatyAnimation(),forKey: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setupLayer()
    {
        let kScreenW = self.view.frame.width
        let kScreenH = self.view.frame.height
        
        let img = UIImage(named: "heart")
        
        heartLayer.position = CGPoint(x:kScreenW/2 , y: 100)
        heartLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        heartLayer.contents = img?.cgImage
        heartLayer.backgroundColor = UIColor.white.cgColor
        self.view.layer.addSublayer(heartLayer)
        
        let beatyImg = UIImage(named:"1")
        
        beatyLayer.position = CGPoint(x:kScreenW/2,y:kScreenH/2)
        beatyLayer.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        beatyLayer.contents = beatyImg?.cgImage
        self.view.layer.addSublayer(beatyLayer)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController
{
    fileprivate func createHeartAnimation() -> CABasicAnimation
    {
        let scaleAni = CABasicAnimation()
        scaleAni.keyPath = "transform.scale"
        
        scaleAni.toValue = 0.6
        scaleAni.duration = 0.8
        scaleAni.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        //重复次数为最大有穷数量级
        scaleAni.repeatCount = Float(CGFloat.greatestFiniteMagnitude)
        return scaleAni
    }
    fileprivate func createBeatyAnimation() -> CABasicAnimation
    {
        let alphaAni = CABasicAnimation()
        alphaAni.keyPath = "opacity"
        alphaAni.toValue = 0.0
        alphaAni.duration = 2.0
        alphaAni.isRemovedOnCompletion = false
        alphaAni.fillMode = kCAFillModeForwards
        return alphaAni
        
    }
}

