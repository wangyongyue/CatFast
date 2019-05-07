//
//  PanelAddSmallCell.swift
//  CatFast
//
//  Created by apple on 2019/4/28.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class PanelAddSmallCell: CollectionTemplate {
    var holder = PanelAddSmallHolder()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.contentView.backgroundColor = Color.white()
        
        let labelStyle = Style().text("添加").textColor(Color.black()).backgroundColor(Color.white()).font(UIFont.systemFont(ofSize: 8)).textAlignment(.center)
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
class PanelAddSmallModel: Cat {
    
    var name:String?
    var image:UIImage?
    
}
class PanelAddSmallHolder: Holder {
    var textOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is PanelAddSmallModel{
            let a = amodel as! PanelAddSmallModel
            
            //            textOb.v_text { () -> String? in
            //
            //                return a.name
            //            }
            //
            
        }
    }
    
    
}
