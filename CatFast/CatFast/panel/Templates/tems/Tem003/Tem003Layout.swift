//
//  Tem003Layout.swift
//  CatFast
//
//  Created by apple on 2019/4/26.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Tem003Layout: CCustomLayout {
    // 内容区域总大小，不是可见区域
    override var collectionViewContentSize: CGSize {
        let width = collectionView!.bounds.size.width - collectionView!.contentInset.left
            - collectionView!.contentInset.right
        let heigthFirstCellSide = width / 2

        let height = CGFloat((collectionView!.numberOfItems(inSection: 0)) -  1) * (width / 3) + heigthFirstCellSide
        
        return CGSize(width: width, height: height)
    }
    
    // 所有单元格位置属性
    override func layoutAttributesForElements(in rect: CGRect)
        -> [UICollectionViewLayoutAttributes]? {
            var attributesArray = [UICollectionViewLayoutAttributes]()
            let cellCount = self.collectionView!.numberOfItems(inSection: 0)
            for i in 0..<cellCount {
                let indexPath =  IndexPath(item:i, section:0)
                let attributes =  self.layoutAttributesForItem(at: indexPath)
                attributesArray.append(attributes!)
            }
            return attributesArray
    }
    
    // 这个方法返回每个单元格的位置和大小
    override func layoutAttributesForItem(at indexPath: IndexPath)
        -> UICollectionViewLayoutAttributes? {
            let attribute =  UICollectionViewLayoutAttributes(forCellWith:indexPath)
            
            //单元格边长
            let widthCellSide = collectionViewContentSize.width
            let heigthCellSide = collectionViewContentSize.width / 3
            let heigthFirstCellSide = collectionViewContentSize.width / 2

            let index = CGFloat(indexPath.item)
            let offset:CGFloat = 5
            
            if index ==  0{
                
                let x:CGFloat = 0.0
                let y = index * heigthCellSide
                let w = widthCellSide
                let h = heigthFirstCellSide - offset
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)
                
            }else{
                
                let x:CGFloat = 0.0
                let y = (index - 1) * heigthCellSide + heigthFirstCellSide
                let w = widthCellSide
                let h = heigthCellSide - offset
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)
                
            }
            
            return attribute
    }
    
    
}
