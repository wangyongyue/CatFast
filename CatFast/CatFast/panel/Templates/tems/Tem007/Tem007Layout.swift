//
//  Tem007Layout.swift
//  CatFast
//
//  Created by apple on 2019/4/26.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Tem007Layout: CCustomLayout {
    // 内容区域总大小，不是可见区域
    override var collectionViewContentSize: CGSize {
        let width = collectionView!.bounds.size.width - collectionView!.contentInset.left
            - collectionView!.contentInset.right
        let height = CGFloat((collectionView!.numberOfItems(inSection: 0))) / 6 * (width / 3  * 4) + 100
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
            //当前单元格布局属性
            let attribute =  UICollectionViewLayoutAttributes(forCellWith:indexPath)
            
            //单元格边长
            let largeCellSide = collectionViewContentSize.width / 3 * 2
            let smallCellSide = collectionViewContentSize.width / 3
            
            //当前行数，每行显示3个图片，1大2小
            let line:Int =  indexPath.item / 3
            //当前行的Y坐标
            let lineOriginY =  largeCellSide * CGFloat(line)
            //右侧单元格X坐标，这里按左右对齐，所以中间空隙大
            let rightLargeX = collectionViewContentSize.width - largeCellSide
            let rightSmallX = collectionViewContentSize.width - smallCellSide
            let offset:CGFloat = 5

            // 每行2个图片，2行循环一次，一共6种位置
            if (indexPath.item % 6 == 0) {
                let x:CGFloat = offset
                let y = offset + lineOriginY
                let w = largeCellSide - 2 * offset
                let h = largeCellSide - 2 * offset
                
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)
                
            } else if (indexPath.item % 6 == 1) {
                
                let x:CGFloat = offset +  rightSmallX
                let y = offset + lineOriginY
                let w = smallCellSide - 2 * offset
                let h = smallCellSide - 2 * offset
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)

            } else if (indexPath.item % 6 == 2) {
                let x:CGFloat = offset +  rightSmallX
                let y = offset + lineOriginY + smallCellSide
                let w = smallCellSide - 2 * offset
                let h = smallCellSide - 2 * offset
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)
               
            } else if (indexPath.item % 6 == 3) {
                
                let x:CGFloat = offset
                let y = offset + lineOriginY
                let w = smallCellSide - 2 * offset
                let h = smallCellSide - 2 * offset
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)
                
            } else if (indexPath.item % 6 == 4) {
                let x:CGFloat = offset
                let y = offset + lineOriginY + smallCellSide
                let w = smallCellSide - 2 * offset
                let h = smallCellSide - 2 * offset
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)

            } else if (indexPath.item % 6 == 5) {
                let x:CGFloat = offset + rightLargeX
                let y = offset + lineOriginY
                let w = largeCellSide - 2 * offset
                let h = largeCellSide - 2 * offset
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)
            }
            
            return attribute
    }
    
   
}
