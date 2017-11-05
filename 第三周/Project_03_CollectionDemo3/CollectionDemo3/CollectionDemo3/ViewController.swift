//
//  ViewController.swift
//  CollectionDemo3
//
//  Created by 张德茂 on 2017/11/5.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    var imageArr :[UIImage] = []
    let cellCount : Int = 11
    @IBOutlet weak var MyCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1..<12
        {
            let image:UIImage = UIImage(named: String(i))!
            imageArr.append(image)
        }
        
        print(imageArr)
        print("****")
        MyCollectionView.collectionViewLayout = MyCollectionLayout()
        let layout = MyCollectionLayout()
        layout.setSize = {
            return self.imageArr
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MyCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.imageView.image = imageArr[indexPath.row]
        
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }


}

