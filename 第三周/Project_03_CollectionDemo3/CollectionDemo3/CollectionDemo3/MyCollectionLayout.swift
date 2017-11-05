//
//  MyCollectionLayout.swift
//  CollectionDemo3
//
//  Created by 张德茂 on 2017/11/5.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit

class MyCollectionLayout: UICollectionViewFlowLayout {
    
    var attributeArr : [UICollectionViewLayoutAttributes] = []
    private var cellWidth:CGFloat!
    //返回image数组函数，控制cell大小
    var setSize:()->(Array<UIImage>) = { return []}
    //列数
    var queueNum : Int = 2
    var hs : [CGFloat] = []
    //间隔大小
    let gap:CGFloat = 5
    private var totalNum : Int!
    private var layoutAtrributes:[UICollectionViewLayoutAttributes] = []
    override func prepare()
    {
        super.prepare()
        hs = []
        for _ in 0..<queueNum
        {
            hs.append(5)
        }
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        totalNum = collectionView?.numberOfItems(inSection: 0)
        for index in 0..<totalNum
        {
            let indexPath = IndexPath(item: index, section: 0)
            let  attribute = layoutAttributesForItem(at: indexPath)
            attributeArr.append(attribute!)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        cellWidth = ((collectionView?.frame.size.width)!)/CGFloat(queueNum)
        
        let attributes = UICollectionViewLayoutAttributes(forCellWith:indexPath)
        let sizes = setSize()
        //print(collectionView?.frame.size.width)
        print(sizes)
        //let cellHeight = sizes[indexPath.row].size.height * cellWidth/sizes[indexPath.row].size.width
        let temp = Int(arc4random()%100)
        let cellHeight = cellWidth + CGFloat(temp)
        attributes.size = CGSize(width: cellWidth, height: cellHeight)
        //第几列
        var nub:CGFloat = 0
        //当前列的y
        var y:CGFloat = 0
        (nub,y) = minH(hhs:hs)
       // let x = cellWidth * nub
        print("indexPath.row:\(indexPath.row) width:\(cellWidth) height:\(cellHeight)")
        attributes.center = CGPoint(x:(nub+0.5)*(cellWidth), y:y+(cellWidth/attributes.size.width*attributes.size.height)/2)
        hs[Int(nub)] = y + cellHeight
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributeArr
    }
    
    override var collectionViewContentSize:CGSize {
        get
        {
            return CGSize(width: (collectionView?.bounds.width)!, height: maxH(hhs:hs))
        }
        set
        {
            self.collectionViewContentSize = newValue
        }
    }
    func minH(hhs:[CGFloat]) -> (CGFloat,CGFloat)
    {
        var num = 0
        var min = hhs[0]
        for i in 1..<hhs.count
        {
            if min>hhs[i]
            {
                min = hhs[i]
                num = i
            }
        }
        return (CGFloat(num),min)
    }
    func maxH(hhs:[CGFloat]) -> CGFloat
    {
        var max = hhs[0]
        for i in 1..<hhs.count
        {
            if max<hhs[i]
            {
                max = hhs[i]
            }
        }
        return max
    }
    
}
