//
//  Nav001Cell.swift
//  CatFast
//
//  Created by apple on 2019/4/27.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Nav001Cell: CollectionTemplate {
    var holder = Nav001CellHolder()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let style = Style().backgroundColor(Color.white())
        let back = CView(style)
        self.contentView.addSubview(back)
        
        let headerView = PanelNavigationView(style)
        self.contentView.addSubview(headerView)
        
        
        back.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(0)
        }
        
        headerView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(Screen.topCellNavH())
            
        }
        let m = Nav001CellModel()
        headerView.loadSmallData(m)
    }
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        holder.setModel(amodel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
}
class Nav001CellModel: Cat {
    
    var name:String?
    var image:UIImage?
    
}
class Nav001CellHolder: Holder {
    var textOb = Observe()
    var imageOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is Nav001CellModel{
            let a = amodel as! Nav001CellModel
            
           
            
        }
    }
    
    
}
