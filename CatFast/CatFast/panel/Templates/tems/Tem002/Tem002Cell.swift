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
        
        let style = Style().backgroundColor(Color.white())
        let headerView = PanelContentView(style)
        self.contentView.addSubview(headerView)
        
        headerView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-10)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.top.equalTo(10)
        }
        let m = Tem002CellModel()
        headerView.loadSmallData(m)
        headerView.isUserInteractionEnabled = false
        
        
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
