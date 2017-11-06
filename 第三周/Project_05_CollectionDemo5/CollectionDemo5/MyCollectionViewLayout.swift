//
//  MyCollectionViewLayout.swift
//  CollectionDemo5
//
//  Created by 张德茂 on 2017/11/5.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class MyCollectionViewLayout: UICollectionViewFlowLayout {
    var cellWidth:CGFloat!
    var attributesArr : [UICollectionViewLayout] = []
    override func prepare()
    {
        super.prepare()
        let kScreenW :CGFloat = (self.collectionView?.bounds.width)!
        cellWidth = kScreenW / 2
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 0
        itemSize = CGSize(width: cellWidth, height: cellWidth)
    }
}
