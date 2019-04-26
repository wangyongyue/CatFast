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
        
        let imgStyle = Style().backgroundColor(Color.black())
        let headerImg = CImageView(imgStyle)
        self.contentView.addSubview(headerImg)
        
        
        let labelStyle = Style().text("test").textColor(Color.black())
        let headerLabel = CLabel(labelStyle)
        self.contentView.addSubview(headerLabel)
        
        
        headerImg.v_image(ob: holder.imageOb)
        headerLabel.v_text(ob: holder.textOb)
        
        headerImg.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(20)
            make.right.equalTo(-0)
            make.bottom.equalTo(-30)
            
        }
        
        headerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerImg.snp_bottomMargin).offset(0)
            make.left.equalTo(20)
            make.right.equalTo(-0)
            make.height.equalTo(30)
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
    var image:UIImage?
    
}
class NewLastCellHolder: Holder {
    var textOb = Observe()
    var imageOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is NewLastCellModel{
            let a = amodel as! NewLastCellModel
            
            textOb.v_text { () -> String? in
                
                return a.name
            }
            imageOb.v_image { () -> UIImage? in
                
                return a.image
            }
            
            
            
        }
    }
    
    
}
