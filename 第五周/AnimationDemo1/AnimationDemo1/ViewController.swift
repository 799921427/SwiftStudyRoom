//
//  ViewController.swift
//  AnimationDemo1
//
//  Created by 张德茂 on 2017/11/17.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func animationProcess(_ sender: Any) {
        //初始化各种数值
        circleProgressLayer.strokeEnd = 0
        progressValue = 0
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(progressShowNumber), userInfo: nil, repeats: true)
    }
    //定时器调用方法
    @objc private func progressShowNumber()
    {
        if progressValue < expectValue
        {
            timer.invalidate()
            circleProgressLayer.strokeEnd = expectValue / 100
            persentLabel.text = "\(expectValue)%"
            return
        }
        if progressValue > expectValue
        {
            timer.invalidate()
            return
        }
        //更新进度文字和进度条的strokeEnd
        circleProgressLayer.strokeEnd = CGFloat(progressValue) / 100
        persentLabel.text = "\(progressValue)%"
        
    }
    @IBOutlet weak var processText: UITextField!
    @IBOutlet weak var aniBtn: UIButton!
    @IBOutlet weak var persentLabel: UILabel!
    
    @IBOutlet weak var processView: UIView!
    var progressValue : CGFloat = 0.0
    var expectValue : CGFloat
    {
        //guard守卫属性，若为假则执行else函数内容
        guard let valueText = processText.text else{return 0}
        guard let value = NumberFormatter().number(from: valueText) else {return 0}
        if CGFloat(value) >= 0 && CGFloat(value) <= 100 {return CGFloat(value)}
        return 0
    }
    
    //懒加载
    lazy var timer = Timer()
    //进度条背景layer
    lazy var circleLayer : CAShapeLayer = {
        let bounds = CGRect(x: 0, y: 0, width: 250, height: 250)
        let circleLayer = CAShapeLayer()
        circleLayer.bounds = bounds
        circleLayer.position = CGPoint(x:bounds.width / 2,y:bounds.height / 2)
        let circlePath = UIBezierPath(ovalIn: bounds)
        circleLayer.path = circlePath.cgPath
        circleLayer.lineWidth = 10
        circleLayer.strokeColor = UIColor.lightGray.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        return circleLayer
        
    }()
    
    lazy var circleProgressLayer : CAShapeLayer = {
        let circleProgressLayer = CAShapeLayer()
        let circleBounds = CGRect(x: 0, y: 0, width: 250, height: 250)
        circleProgressLayer.bounds = circleBounds
        circleProgressLayer.position
            = CGPoint(x:circleBounds.width / 2,y:circleBounds.height / 2)
        let circleProgressPath = UIBezierPath(arcCenter: CGPoint(x:circleBounds.width / 2,y:circleBounds.height / 2), radius: circleBounds.width / 2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        circleProgressLayer.path = circleProgressPath.cgPath
        circleProgressLayer.strokeStart = 0
        circleProgressLayer.strokeEnd = 1
        circleProgressLayer.lineWidth = 10
        circleProgressLayer.strokeColor = UIColor(red: 0/255.0, green: 151/255.0, blue: 255/255.0, alpha: 1).cgColor
        circleProgressLayer.fillColor = UIColor.clear.cgColor
        return circleProgressLayer
        
    }()
    var progressLayer : CAShapeLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        processView.layer.addSublayer(circleLayer)
        processView.layer.addSublayer(circleProgressLayer)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController
{
    fileprivate func setupUI()
    {
        let bounds = CGRect(x: 0, y: 0, width: 250, height: 250)
        progressLayer = CAShapeLayer()
        progressLayer.backgroundColor = UIColor.clear.cgColor
        progressLayer.bounds = CGRect(x: 0, y: 0, width: 250, height: 250)
        progressLayer.position = processView.center
        self.view.layer.addSublayer(progressLayer)
        let processPath = UIBezierPath(ovalIn: bounds)
        progressLayer.path = processPath.cgPath
        progressLayer.lineWidth = 16
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.lightGray.cgColor
        print("imageViewCenter:\(processView.center) viewCenter:\(view.center)")
        
    }
}
//MARK: - CAShapeLayer基础实用
//extension STShapeLayerViewController{
//
//    ///基础shareLayer绘制
//    fileprivate func basicShareLayer (){
//        //实例化CAShapeLayer
//        let basicLayer = CAShapeLayer()
//
//        //        设置layer的大小
//        basicLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        //        将layer添加到视图上。
//        view.layer.addSublayer(basicLayer)
//        //        设置layer的位置
//        basicLayer.position = view.center
//
//        //        创建贝塞尔曲线
//        let path = UIBezierPath.init(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 100))
//
//        //        将贝塞尔曲线作用在layer上
//        basicLayer.path = path.cgPath
//
//        //        设置layer的填充色
//        basicLayer.fillColor = UIColor.clear.cgColor
//        //        设置layer边框的填充色
//        basicLayer.strokeColor = UIColor.red.cgColor
//        //        设置layer边框的宽度
//        basicLayer.lineWidth = 2
//
//        //        设置layer边框的起点位置
//        basicLayer.strokeStart = 0
//        //        设置layer边框的终点位置
//        basicLayer.strokeEnd = 1
//
//
//        basicLayer.lineDashPattern = [5,2,10,5]
//
//
//    }
//
//    ///绘制空心进度的layer
//    fileprivate func hollowLayer(){
//        //        创建空心的layer
//        let hollowLayer = CAShapeLayer()
//        hollowLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        view.layer.addSublayer(hollowLayer)
//        hollowLayer.position = view.center
//
//        //        最外面待圆角的方形path
//        let squarePath = UIBezierPath.init(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), cornerRadius: 5)
//        //        中间镂空的圆形path
//        let hollowPath = UIBezierPath.init(ovalIn: CGRect(x: 10, y: 10, width: 80, height: 80))
//
//        squarePath.append(hollowPath)
//        hollowLayer.path = squarePath.cgPath
//
//        hollowLayer.fillColor = UIColor.lightGray.cgColor
//        //        设置路径的填充模式为两个图形的非交集
//        hollowLayer.fillRule = kCAFillRuleEvenOdd
//
//
//
//        //        创建进度layer
//        let processSectorLayer = CAShapeLayer()
//        view.layer.addSublayer(processSectorLayer)
//        processSectorLayer.bounds = CGRect(x: 0, y: 0, width: 70, height: 70)
//        processSectorLayer.position = view.center
//
//        //        进度的path
//        let processSectorPath = UIBezierPath.init(arcCenter: CGPoint.init(x: 35, y: 35), radius: 17.5, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
//
//
//        processSectorLayer.path = processSectorPath.cgPath
//
//        processSectorLayer.lineWidth = 35
//
//        //        进度的起点和结束位置，设置进度条修改这个值和结束数值就可以了
//        processSectorLayer.strokeStart = 0.5
//        processSectorLayer.strokeEnd = 0.75
//
//        processSectorLayer.strokeColor = UIColor.lightGray.cgColor
//        processSectorLayer.fillColor = UIColor.clear.cgColor
//    }
//
//
//
//}
//
//
