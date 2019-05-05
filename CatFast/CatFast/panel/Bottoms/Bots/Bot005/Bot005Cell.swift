//
//  Bot005Cell.swift
//  CatFast
//
//  Created by apple on 2019/5/5.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Bot005Cell: CollectionTemplate {
    var holder = Bot005CellHolder()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let style = Style().backgroundColor(Color.white())
        let back = CView(style)
        self.contentView.addSubview(back)
        
        let headerView = PanelTabBarView()
        self.contentView.addSubview(headerView)
        
        back.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(0)
            
        }
        
        headerView.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(Screen.bottomH())
            
        }
        let m = Bot005CellModel()
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
class Bot005CellModel: Cat {
    
    var name:String?
    var image:UIImage?
    
}
class Bot005CellHolder: Holder {
    var textOb = Observe()
    var imageOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is Bot005CellModel{
            let a = amodel as! Bot005CellModel
            
            
        }
    }
    
    
}
