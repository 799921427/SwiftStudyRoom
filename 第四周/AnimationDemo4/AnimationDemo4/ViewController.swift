//
//  ViewController.swift
//  AnimationDemo4
//
//  Created by 张德茂 on 2017/11/12.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mask = CALayer()
    var imageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setupUI()
    {
        UIApplication.shared.isStatusBarHidden = true
        self.view.backgroundColor = UIColor(red: 0.117, green: 0.631, blue: 0.949, alpha: 1)
        imageView.image = UIImage(named:"back")
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        mask.position = self.view.center
        mask.contents = UIImage(named:"2")?.cgImage
        mask.contentsGravity = kCAGravityResizeAspect
        mask.bounds = CGRect(x: 0, y: 0, width: 100, height: 80)
        mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)
       // self.view.layer.mask = mask
        imageView.layer.mask = mask
        animateMask()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension  ViewController
{
    fileprivate func animateMask()
    {
        let keyFrameAni = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAni.fillMode = kCAFillModeForwards
        keyFrameAni.isRemovedOnCompletion = false
        keyFrameAni.duration = 0.6
        keyFrameAni.beginTime = CACurrentMediaTime()+10
        keyFrameAni.timingFunctions = [CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut),CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)]
        let initalBounds = NSValue(cgRect:mask.bounds)
        let secondBounds = NSValue(cgRect:CGRect(x: 0, y: 0, width: 90, height: 70))
        let finalBounds = NSValue(cgRect:CGRect(x: 0, y: 0, width: 2900, height: 2700))
        keyFrameAni.values = [initalBounds,secondBounds,finalBounds]
        keyFrameAni.keyTimes = [0,0.7,1]
        self.mask.add(keyFrameAni, forKey: "bounds")
    }
}

