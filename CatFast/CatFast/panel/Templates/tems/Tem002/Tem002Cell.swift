//
//  Tem002Cell.swift
//  CatFast
//
//  Created by apple on 2019/4/26.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Tem002Cell: CollectionTemplate {
    var holder = Tem002CellHolder()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imgStyle = Style().backgroundColor(Color.yellow())
        let headerImg = CImageView(imgStyle)
        self.contentView.addSubview(headerImg)
        
        
        let labelStyle = Style().text("test").textColor(Color.black()).backgroundColor(Color.white())
        let headerLabel = CLabel(labelStyle)
        self.contentView.addSubview(headerLabel)
        
        headerImg.v_image(ob: holder.imageOb)
        headerLabel.v_text(ob: holder.textOb)
        
        
        
        headerImg.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-30)
            
        }
        
        headerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerImg.snp_bottomMargin).offset(0)
            make.left.equalTo(10)
            make.right.equalTo(-10)
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
class Tem002CellModel: Cat {
    
    var name:String?
    var image:UIImage?
    
}
class Tem002CellHolder: Holder {
    var textOb = Observe()
    var imageOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is Tem002CellModel{
            let a = amodel as! Tem002CellModel
            
            textOb.v_text { () -> String? in
                
                return a.name
            }
            
            imageOb.v_image { () -> UIImage? in
                
                return a.image
            }
            
        }
    }
    
    
}
