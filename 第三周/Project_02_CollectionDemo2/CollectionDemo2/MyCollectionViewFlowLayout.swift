//
//  MyCollectionViewFlowLayout.swift
//  CollectionDemo2
//
//  Created by 张德茂 on 2017/11/4.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class MyCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var allAttributes : [UICollectionViewFlowLayout] = []
    override func prepare()
    {
        super.prepare()
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        let kScreenW:CGFloat = self.collectionView!.frame.size.width
        let itemWH:CGFloat = kScreenW / 2
        itemSize = CGSize(width:itemWH,height:itemWH)
        print(itemWH)
        print(kScreenW)
        
        
    }

}
