//
//  CCustomLayout.swift
//  CatFast
//
//  Created by apple on 2019/4/25.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class CCustomLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(_ scrollDirection:UICollectionView.ScrollDirection) {
        self.init()
        self.scrollDirection = scrollDirection
        
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        self.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        self.estimatedItemSize = CGSize.init(width: 100, height: 100)
        
    }
    
    // 内容区域总大小，不是可见区域
//    override var collectionViewContentSize: CGSize {
//
//        return CGSize(width: width, height: height)
//    }
    
    // 所有单元格位置属性
//    override func layoutAttributesForElements(in rect: CGRect)
//        -> [UICollectionViewLayoutAttributes]? {
//            var attributesArray = [UICollectionViewLayoutAttributes]()
//            let cellCount = self.collectionView!.numberOfItems(inSection: 0)
//            for i in 0..<cellCount {
//                let indexPath =  IndexPath(item:i, section:0)
//                let attributes =  self.layoutAttributesForItem(at: indexPath)
//                attributesArray.append(attributes!)
//            }
//            return attributesArray
//    }
    
    // 这个方法返回每个单元格的位置和大小
//    override func layoutAttributesForItem(at indexPath: IndexPath)
//        -> UICollectionViewLayoutAttributes? {
//
//            return attribute
//    }
    
   
}
    
