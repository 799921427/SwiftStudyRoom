//
//  MyCollectionViewFlowLayout.swift
//  CollectionDemo1
//
//  Created by 张德茂 on 2017/11/3.
//  Copyright © 2017年 张德茂. All rights reserved.
//

import UIKit


class MyCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    let numberCellNumberOfOneRow = 4
    let numberOfRow = 2
    let cellSpacing = 10
    var page :Int = 0
    
    var attributesArr : [UICollectionViewLayoutAttributes] = []
    
    override func prepare() {
        super.prepare()
        
        setUp()
        //重新定制Cell样式
        designMyLayout()
    }
    func setUp()
    {
        scrollDirection = .horizontal
        //竖直间隔
        minimumLineSpacing = 0
        //水平间隔
        minimumInteritemSpacing = 0
        collectionView?.isPagingEnabled = true
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = true
        
    }
    func designMyLayout()
    {
        let kScreenW = collectionView!.frame.size.width
        let itemWH : CGFloat = (kScreenW - CGFloat((numberCellNumberOfOneRow + 1) * cellSpacing)) / 4
        itemSize = CGSize(width: itemWH, height: itemWH)
        let spacing = CGFloat(numberOfRow) * itemWH + CGFloat(cellSpacing * (numberOfRow - 1))
        let inserMargin = ((collectionView?.bounds.height)! - spacing) * 0.8
        collectionView?.contentInset = UIEdgeInsetsMake(inserMargin,0,inserMargin,0)
        
        
        let itemsCount : Int = (collectionView?.numberOfItems(inSection: 0))!
        for itemIndex in 0..<itemsCount
        {
            let indexPath = IndexPath(item: itemIndex, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith:indexPath)
            page = itemIndex / (numberOfRow * numberCellNumberOfOneRow)
            //计算x，y
            let itemXIndex : CGFloat = CGFloat(itemIndex % numberCellNumberOfOneRow)
            let xSum = CGFloat(itemXIndex + 1 + CGFloat(page) * CGFloat(numberCellNumberOfOneRow + 1))
            let xSpacing:CGFloat = CGFloat(cellSpacing) * xSum
            let x = itemSize.width * ( itemXIndex + CGFloat( CGFloat(page) * CGFloat(numberCellNumberOfOneRow))) + xSpacing
            let itemYIndex :CGFloat = CGFloat((itemIndex - page * numberOfRow * numberCellNumberOfOneRow) / numberCellNumberOfOneRow)
            let y = itemSize.height * itemYIndex + CGFloat(cellSpacing) * itemYIndex
            attributes.frame = CGRect(x: x, y: y, width: itemSize.width, height: itemSize.height)
            //  把每个新的属性保存起来
            attributesArr.append(attributes)
            print("spacing:\(spacing) inserMargin:\(inserMargin)")
            print(collectionView!.frame.size.height)
            print("\(itemIndex) itemXIndex: \(itemXIndex) x: \(x) itemSizeHeight:\(itemSize.height) ")
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var rectAttributes : [UICollectionViewLayoutAttributes] = []
        attributesArr.map({
            if rect.contains($0.frame)
            {
                rectAttributes.append($0)
            }
        })
        return rectAttributes
    }
}
