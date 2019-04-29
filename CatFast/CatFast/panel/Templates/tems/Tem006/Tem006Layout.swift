//
//  Tem006Layout.swift
//  CatFast
//
//  Created by apple on 2019/4/26.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Tem006Layout: CCustomLayout {
    // 内容区域总大小，不是可见区域
    override var collectionViewContentSize: CGSize {
        let width = collectionView!.bounds.size.width - collectionView!.contentInset.left
            - collectionView!.contentInset.right
        let height = CGFloat((collectionView!.numberOfItems(inSection: 0)/5 + 1)) * 3 * (width / 2)
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
            let largeCellSide = collectionViewContentSize.width
            let smallCellSide = collectionViewContentSize.width / 2
            let heightCellSide = collectionViewContentSize.width / 2

            //当前行数，每行显示3个图片，1大2小
            let lineSection:Int =  indexPath.item / 5
            let lineItem:Int =  indexPath.item / 2 + 1
            let offset:CGFloat = 5

            //当前行的Y坐标
            let lineOriginY =  heightCellSide * 3 * CGFloat(lineSection)
            //右侧单元格X坐标，这里按左右对齐，所以中间空隙大
            let rightLargeX = collectionViewContentSize.width - largeCellSide
            let rightSmallX = collectionViewContentSize.width - smallCellSide
            
            // 每行2个图片，3行循环一次，一共6种位置
            if (indexPath.item % 5 == 0) {
                let x:CGFloat = offset
                let y = offset + lineOriginY
                let w = largeCellSide - 2 * offset
                let h = heightCellSide - 2 * offset
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)
                
            }else if (indexPath.item % 5 == 1) {
                let x:CGFloat = offset
                let y = offset +  heightCellSide + lineOriginY
                let w = smallCellSide - 2 * offset
                let h = heightCellSide - 2 * offset
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)
            }else if (indexPath.item % 5 == 2) {
                let x:CGFloat = offset + smallCellSide
                let y = offset +  heightCellSide + lineOriginY
                let w = smallCellSide - 2 * offset
                let h = heightCellSide - 2 * offset
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)
            }else if (indexPath.item % 5 == 3) {
                let x:CGFloat = offset
                let y = offset +  heightCellSide * 2 + lineOriginY
                let w = smallCellSide - 2 * offset
                let h = heightCellSide - 2 * offset
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)
            }else if (indexPath.item % 5 == 4) {
                let x:CGFloat = offset + smallCellSide
                let y = offset +  heightCellSide * 2 + lineOriginY
                let w = smallCellSide - 2 * offset
                let h = heightCellSide - 2 * offset
                attribute.frame = CGRect.init(x: x, y: y, width: w, height: h)
            }
            
            
            
            
            
            
            return attribute
    }
    
   
}
