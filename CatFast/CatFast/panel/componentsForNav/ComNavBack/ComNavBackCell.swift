//
//  ComNavBackCell.swift
//  CatFast
//
//  Created by apple on 2019/4/29.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class ComNavBackCell: CollectionTemplate {
    var holder = ComNavBackCellHolder()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = Color.white()
        
      
        
        let labelStyle = Style().text("back").textColor(Color.black()).backgroundColor(Color.white())
        let headerLabel = CLabel(labelStyle)
        self.contentView.addSubview(headerLabel)
        
        headerLabel.v_text(ob: holder.textOb)
        
        
        headerLabel.textAlignment = .center
        
        headerLabel.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
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
class ComNavBackCellModel: Cat {
    
    var name:String?
    var image:UIImage?
    
}
class ComNavBackCellHolder: Holder {
    var textOb = Observe()
    var imageOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is ComNav010CellModel{
            let a = amodel as! ComNav010CellModel
            
           
            
        }
    }
    
    
}
