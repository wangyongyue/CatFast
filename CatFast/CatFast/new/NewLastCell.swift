//
//  NewLastCell.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class NewLastCell: CollectionTemplate {
    
    var holder = NewCellHolder()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
        
        let labelStyle = Style().text("添加").textColor(Color.gray()).font(UIFont.systemFont(ofSize: 18)).textAlignment(.center)
        let headerLabel = CLabel(labelStyle)
        self.contentView.addSubview(headerLabel)
        
        
        headerLabel.v_text(ob: holder.textOb)
        
      
        headerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(20)
            make.right.equalTo(-0)
            make.bottom.equalTo(-10)
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
class NewLastCellModel: Cat {
   
    var name:String?
    
}
class NewLastCellHolder: Holder {
    var textOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is NewLastCellModel{
            let a = amodel as! NewLastCellModel
            
           
        }
    }
    
    
}
