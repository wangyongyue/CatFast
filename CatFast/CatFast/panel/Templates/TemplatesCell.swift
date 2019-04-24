//
//  TemplatesCell.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class TemplatesCell: CollectionTemplate {
    var holder = TemplatesCellHolder()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imgStyle = Style().x(0).y(0).width(Screen.width()/3 - 20).height(Screen.width()/3 - 20).backgroundColor(Color.yellow())
        let headerImg = CImageView(imgStyle)
        self.contentView.addSubview(headerImg)
        
        
        let labelStyle = Style().x(0).y(100).width(Screen.width()/3 - 20).height(30).text("test").textColor(Color.black()).backgroundColor(Color.white())
        let headerLabel = CLabel(labelStyle)
        self.contentView.addSubview(headerLabel)
        
        headerImg.v_image(ob: holder.imageOb)
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
class TemplatesCellModel: Cat {
    override init() {
        super.init()
        v_palm = "NewCell"
    }
    var name:String?
    var image:UIImage?
    
}
class TemplatesCellHolder: Holder {
    var textOb = Observe()
    var imageOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is TemplatesCellModel{
            let a = amodel as! TemplatesCellModel
            
            textOb.v_text { () -> String? in
                
                return a.name
            }
            
            imageOb.v_image { () -> UIImage? in
                
                return a.image
            }
            
        }
    }
    
    
}