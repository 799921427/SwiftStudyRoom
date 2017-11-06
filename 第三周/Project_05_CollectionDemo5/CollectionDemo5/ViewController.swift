//
//  ViewController.swift
//  CollectionDemo5
//
//  Created by 张德茂 on 2017/11/5.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

    @IBOutlet weak var MyCollectionView: UICollectionView!
    var maskView : UIView!
    var cellRect : CGRect!
    var changeRect : CGRect!
    override func viewDidLoad() {
        super.viewDidLoad()
        MyCollectionView.collectionViewLayout = MyCollectionViewLayout()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MyCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.imgURL = String(indexPath.row+1)
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    @objc func showPic(btn:UIButton)
    {
        UIView.animate(withDuration: 1, animations: {
            btn.frame = self.cellRect
        }) { (finish) in
            btn.removeFromSuperview()
            self.maskView.removeFromSuperview()
            self.maskView = nil
            self.cellRect = nil
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("*******")
//        let cell = collectionView.cellForItem(at: indexPath)
//        maskView = UIView.init(frame: view.bounds)
//        maskView.backgroundColor = UIColor.black
//        maskView.alpha = 0.5
//        view.addSubview(maskView)
//
//        //cell在View的位置
//        cellRect = cell?.convert((cell?.bounds)!,to:view)
//        print("cellRect:\(cellRect)")
//        let btn = MyButton.init(frame:cellRect)
//        let img = UIImage(named:String(indexPath.row+1))
//        btn.bImage = img
//        btn.addTarget(self, action: #selector(showPic(btn:)), for: .touchUpInside)
//        print(btn.bImageView.frame.size.height)
//        view.addSubview(btn)
//
//        var changeH:CGFloat
//        var changeW:CGFloat
//        //图片长宽的比例与屏幕长宽的比例的对比
//        if (img?.size.width)!/(img?.size.height)! >= view.frame.size.width/view.frame.size.height{
//            //对比图片实际宽与屏幕宽
//            if (img?.size.width)!>view.frame.size.width {
//                changeH = (img?.size.height)!*view.frame.size.width/(img?.size.width)!
//                changeRect = CGRect(x: 0, y: (view.frame.size.height-changeH)/2, width:view.frame.size.width, height: changeH)
//            }else{
//                changeRect = CGRect(x: (view.frame.size.width-(img?.size.width)!)/2, y: (view.frame.size.height-(img?.size.height)!)/2, width: (img?.size.width)!,height: (img?.size.height)!)
//            }
//        }else{
//            if (img?.size.height)!>view.frame.size.height {
//                changeW = (img?.size.width)!*view.frame.size.height/(img?.size.height)!
//                changeRect = CGRect(x: (view.frame.size.width-changeW)/2, y: 0, width: changeW, height: view.frame.size.height)
//            }else{
//                changeRect = CGRect(x: (view.frame.size.width-(img?.size.width)!)/2, y: (view.frame.size.height-(img?.size.height)!)/2, width: (img?.size.width)!,height: (img?.size.height)!)
//            }
//        }
//        UIView.animate(withDuration: 1, animations: {
//            btn.frame = self.changeRect
//            })
//
//
        
    }
}

