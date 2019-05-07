//
//  PanelAddCell.swift
//  CatFast
//
//  Created by apple on 2019/4/26.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class PanelAddCell: CollectionTemplate {
    var holder = PanelAddCellHolder()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.contentView.backgroundColor = Color.white()
        
        let labelStyle = Style().text("添加").textColor(Color.black()).backgroundColor(Color.white()).textAlignment(.center)
        let headerLabel = CLabel(labelStyle)
        self.contentView.addSubview(headerLabel)
        
        headerLabel.v_text(ob: holder.textOb)
        
        headerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
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
class PanelAddCellModel: Cat {
    
    var name:String?
    var image:UIImage?
    
}
class PanelAddCellHolder: Holder {
    var textOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is PanelAddCellModel{
            let a = amodel as! PanelAddCellModel
            
//            textOb.v_text { () -> String? in
//                
//                return a.name
//            }
//            
        
        }
    }
    
    
}
