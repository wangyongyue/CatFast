//
//  Com006Cell.swift
//  CatFast
//
//  Created by apple on 2019/4/26.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Com006Cell: CollectionTemplate {
    var holder = Com006CellHolder()
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
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(-30)
            
        }
        headerLabel.textAlignment = .center
        
        headerLabel.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(30)
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
class Com006CellModel: Cat {
   
    var name:String?
    var image:UIImage?
    
}
class Com006CellHolder: Holder {
    var textOb = Observe()
    var imageOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is Com006CellModel{
            let a = amodel as! Com006CellModel
            
            textOb.v_text { () -> String? in
                
                return a.name
            }
            
            imageOb.v_image { () -> UIImage? in
                
                return a.image
            }
            
        }
    }
    
    
}

