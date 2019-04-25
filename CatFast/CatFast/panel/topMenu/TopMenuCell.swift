//
//  TopMenuCell.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class TopMenuCell: CollectionTemplate {
    var holder = TopMenuCellHolder()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        
        
        let labelStyle = Style().text("test").textColor(Color.black()).backgroundColor(Color.white())
        let headerLabel = CLabel(labelStyle)
        self.contentView.addSubview(headerLabel)
        
        headerLabel.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
        }
        
        headerLabel.v_text(ob: holder.textOb)
        
        
    }
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        holder.setModel(amodel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
class TopMenuCellModel: Cat {
    override init() {
        super.init()
        v_palm = "TopMenuCell"
    }
    var name:String?
    var image:UIImage?
    
}
class TopMenuCellHolder: Holder {
    var textOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is TopMenuCellModel{
            let a = amodel as! TopMenuCellModel
            
            textOb.v_text { () -> String? in
                
                return a.name
            }
        
            
        }
    }
    
    
}
