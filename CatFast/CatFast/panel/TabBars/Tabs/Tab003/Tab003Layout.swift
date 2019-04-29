//
//  Tab003Layout.swift
//  CatFast
//
//  Created by apple on 2019/4/28.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Tab003Layout: CCustomLayout {
    // 内容区域总大小，不是可见区域
    override var collectionViewContentSize: CGSize {
        let width = collectionView!.bounds.size.width - collectionView!.contentInset.left
            - collectionView!.contentInset.right
        let height = collectionView!.bounds.size.height - collectionView!.contentInset.top
            - collectionView!.contentInset.bottom
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
            
            let w = collectionViewContentSize.width / 4
            let h = collectionViewContentSize.height
            let index = CGFloat(indexPath.row)
            
            if index < 4{
                attribute.frame = CGRect(x: index * w, y:0, width:w,height:h)
                
            }else{
                
                attribute.frame = CGRect(x: 0, y:0, width:0,height:0)
                
            }
            
            
            
            
            return attribute
    }
    
    
}
