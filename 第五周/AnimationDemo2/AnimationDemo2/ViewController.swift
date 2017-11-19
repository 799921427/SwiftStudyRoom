//
//  ViewController.swift
//  AnimationDemo2
//
//  Created by 张德茂 on 2017/11/18.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var layer : CALayer =
        {
       let layer = CALayer()
        layer.frame = CGRect(x:22, y: self.view.frame.height/2-40, width: 10, height: 80)
        layer.backgroundColor = UIColor.red.cgColor
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        layer.add(scaleYAnimation(), forKey: "scaleAnimation")
        return layer
    }()
    lazy var replicatorLayer : CAReplicatorLayer = {
       let replicatorLayer = CAReplicatorLayer()
        //设置复制层里面包含子层的个数
        replicatorLayer.instanceCount = 8
        //设置子层相对于前一个层的偏移量
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(50, 0, 0)
        //设置子层相对于前一个层的延迟时间
        replicatorLayer.instanceDelay = 0.1
        //设置层的颜色，(前提是要设置层的背景颜色，如果没有设置背景颜色，默认是透明的，再设置这个属性不会有效果。
        replicatorLayer.instanceColor = UIColor.red.cgColor
        replicatorLayer.instanceRedOffset = -0.1
        replicatorLayer.instanceGreenOffset = -0.1
        replicatorLayer.instanceBlueOffset = -0.1
        return replicatorLayer
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        replicatorLayer.addSublayer(layer)
        self.view.layer.addSublayer(replicatorLayer)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
extension ViewController
{
    fileprivate func scaleYAnimation() -> CABasicAnimation
    {
        let animation = CABasicAnimation(keyPath: "transform.scale.y")
        animation.toValue = 0.1
        animation.duration = 0.3
        animation.autoreverses = true
        animation.repeatCount = MAXFLOAT
        return animation
    }
    
}

