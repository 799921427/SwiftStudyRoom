//
//  ViewController.swift
//  Project 01 - TipCalculator
//
//  Created by 张德茂 on 2017/10/16.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController:UIViewController {
    var priceText : UITextField!
    var tipPersent : UILabel!
    var tipPrice : UILabel!
    var totalPrice : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.title = "111111"
        //价格输入框
        let screen:CGRect = UIScreen.main.bounds
        let textWidth:CGFloat = screen.size.width * 2 / 3
        let textHeight:CGFloat = 80
        priceText = UITextField(frame:CGRect(x:screen.size.width / 6,y:100,width:textWidth,height:textHeight))
        priceText.placeholder = "$0.00"
        
        priceText.font = UIFont.systemFont(ofSize: 50)
        priceText.textAlignment = .right
        self.navigationItem.title = "Tip Calculator"
        self.view.addSubview(priceText)
        
        //TipLabel 
        let tipLabelWidth:CGFloat = 100
        let tipLabelHeight:CGFloat = 30
        
        self.tipPersent = UILabel(frame:CGRect(x:screen.size.width / 4,y:200,width:tipLabelWidth,height:tipLabelHeight))
        tipPersent.text = "Tip(%15)"
        tipPersent.font = UIFont(name:"Heiti SC",size: 15)
        tipPersent.textColor = .black
        tipPersent.textAlignment = .right
        self.view.addSubview(tipPersent)
        
        self.tipPrice = UILabel(frame:CGRect(x:screen.size.width / 4 + 120,y:200,width:tipLabelWidth,height:tipLabelHeight))
        tipPrice.text = "$0.00"
        tipPrice.font = UIFont(name:"Heiti SC",size: 15)
        tipPrice.textColor = .black
        tipPrice.textAlignment = .right
        self.view.addSubview(tipPrice)
        
        let totalLabel = UILabel(frame:CGRect(x:screen.size.width / 4 ,y:250,width:tipLabelWidth,height:tipLabelHeight))
        totalLabel.text = "Total"
        totalLabel.font = UIFont(name:"Heiti SC",size: 15)
        totalLabel.textColor = .black
        totalLabel.textAlignment = .right
        self.view.addSubview(totalLabel)
        
        self.totalPrice = UILabel(frame:CGRect(x:screen.size.width / 4 + 120,y:250,width:tipLabelWidth,height:tipLabelHeight))
        totalPrice.text = "0.00"
        totalPrice.font = UIFont(name:"Heiti SC",size: 15)
        totalPrice.textColor = .black
        totalPrice.textAlignment = .right
        self.view.addSubview(totalPrice)
        
        //添加slide
        let slideWidth:CGFloat = screen.size.width*5/6
        let slideHeight:CGFloat = 30
        let slider = UISlider(frame:CGRect(x:screen.size.width*1/12,y:300,width:slideWidth,height:slideHeight))
        slider.minimumValue = 0.0;
        slider.maximumValue = 1.0;
        slider.value = 0.5;
        slider.addTarget(self,action:#selector(sliderValueChange(slider:)),for:.valueChanged)
       self.view.addSubview(slider)
        
        
        
        
        

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func sliderValueChange(slider:UISlider)
    {
    let progressAsFloat = Float(slider.value)
       
    if let text = self.priceText.text
    {
        if let price = Float(text)
        {
            self.tipPersent.text = String(format:"Tip(%.2lf)",progressAsFloat*100)
            self.tipPrice.text = String(format:"$%.2lf",price*progressAsFloat)
            self.totalPrice.text = String(format:"$%.2lf",price*progressAsFloat + price)
        }
    }
    
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

