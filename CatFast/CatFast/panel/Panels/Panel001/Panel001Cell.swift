//
//  Panel001Cell.swift
//  CatFast
//
//  Created by apple on 2019/4/28.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Panel001Cell: CollectionTemplate {
    var holder = Panel001CellHolder()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
        let labelStyle = Style().text("content").textColor(Color.black()).backgroundColor(Color.white())
        let headerLabel = CLabel(labelStyle)
        self.contentView.addSubview(headerLabel)
        
        headerLabel.v_text(ob: holder.textOb)
        
     
        
        headerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(Screen.top())
            make.left.equalTo(0)
            make.right.equalTo(-10)
            make.bottom.equalTo(Screen.bottom())
        }
        
        
    }
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        holder.setModel(amodel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
}
class Panel001CellModel: Cat {
    
    var name:String?
    
}
class Panel001CellHolder: Holder {
    var textOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is Panel001CellModel{
            let a = amodel as! Panel001CellModel
          
            
        }
    }
    
    
}
