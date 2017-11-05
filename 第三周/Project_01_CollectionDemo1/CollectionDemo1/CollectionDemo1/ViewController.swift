//
//  ViewController.swift
//  CollectionDemo1
//
//  Created by 张德茂 on 2017/11/3.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

    var pageNum : Int!
    @IBOutlet weak var pageContrl: UIPageControl!
    var numOfCell:Int = 10
    @IBOutlet weak var MyCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionViewSetup()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func CollectionViewSetup()
    {
        MyCollectionView.collectionViewLayout = MyCollectionViewFlowLayout()
        pageNum = MyCollectionViewFlowLayout().numberCellNumberOfOneRow * MyCollectionViewFlowLayout().numberOfRow
        pageContrl.numberOfPages = Int(ceil(Double(numOfCell) / Double(pageNum)))
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfCell
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = MyCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.num = String(indexPath.row+1)
        pageContrl.currentPage = indexPath.row / pageNum
        return cell
    }
    
}

