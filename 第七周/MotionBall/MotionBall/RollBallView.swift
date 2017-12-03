//
//  RollBallView.swift
//  AnimationBall
//
//  Created by 张德茂 on 2017/12/1.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit
import CoreMotion

class RollBallView: UIView {
    var lastUpdateTime: Date? = nil
    //picture's height and width
    var imageWidth : CGFloat = 50
    var imageHeight : CGFloat = 50
    
    var accelleration = CMAcceleration()
    lazy var imageView : UIImageView =
        {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            imageView.backgroundColor = .red
            imageView.layer.cornerRadius = 25
            imageView.layer.masksToBounds = true
            return imageView
    }()
    
    //the velocity of the ball at x and y
    var ballXVelocity : Double = 0
    var ballYVelocity : Double = 0
    
    //the current location of the imageView
    var currentPoint = CGPoint()
    {
        didSet{
            
            //when the ball crash to the x left wall
            if currentPoint.x <= imageWidth / 2
            {
                currentPoint.x = imageWidth / 2
                ballXVelocity = -ballXVelocity * 0.8
            }
            //when the ball crash to the x right wall
            if currentPoint.x >= bounds.size.width - imageWidth / 2
            {
                currentPoint.x = bounds.size.width - imageWidth / 2
                ballXVelocity = -ballXVelocity * 0.8
            }
            //when the ball crash to the y left wall
            if currentPoint.y <= imageHeight / 2
            {
                currentPoint.y = imageHeight / 2
                ballYVelocity = -ballYVelocity * 0.8
            }
            //when the ball crash to the y right wall
            if currentPoint.y >= bounds.size.height - imageHeight / 2
            {
                currentPoint.y = bounds.size.height - imageHeight / 2
                ballYVelocity = -ballYVelocity * 0.8
            }
            imageView.center = currentPoint
        }
    }
    override init(frame:CGRect)
    {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI()
    {
        //backgroundColor = .lightGray
        //imageView.image = UIImage(named:"1")
        addSubview(imageView)
        print("enter")
        currentPoint = center
        imageView.center = currentPoint
    }
    
    func updateLocation(multiplier:Double)
    {
        if(lastUpdateTime != nil)
        {
            let updatePeriod : Double = Date.init().timeIntervalSince(lastUpdateTime!)
            ballXVelocity = ballXVelocity + accelleration.x * updatePeriod
            ballYVelocity = ballYVelocity - accelleration.y * updatePeriod
            
            let coefficient = updatePeriod * multiplier
            currentPoint = CGPoint(x: currentPoint.x + CGFloat(ballXVelocity * coefficient), y: currentPoint.y + CGFloat(ballYVelocity * coefficient))
        }
        lastUpdateTime = Date()
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

