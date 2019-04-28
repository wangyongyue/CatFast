//
//  Panel005Cell.swift
//  CatFast
//
//  Created by apple on 2019/4/28.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Panel005Cell: CollectionTemplate {
    var holder = Panel005CellHolder()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let navigationStyle = Style().text("navigation").textColor(Color.black()).backgroundColor(Color.white()).textAlignment(.center)
        let navigationLabel = CLabel(navigationStyle)
        self.contentView.addSubview(navigationLabel)
        
        
        let labelStyle = Style().text("content").textColor(Color.black()).backgroundColor(Color.white()).textAlignment(.center)
        let headerLabel = CLabel(labelStyle)
        self.contentView.addSubview(headerLabel)
        
        let tabBarStyle = Style().text("tabBar").textColor(Color.black()).backgroundColor(Color.white()).textAlignment(.center)
        let tabBarLabel = CLabel(tabBarStyle)
        self.contentView.addSubview(tabBarLabel)
        
        
        navigationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(0)
            make.right.equalTo(-10)
            make.height.equalTo(Screen.top())
        }
        
        headerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(Screen.top() + 10)
            make.left.equalTo(0)
            make.right.equalTo(-10)
            make.bottom.equalTo(Screen.bottom())
        }
        
        tabBarLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(-10)
            make.height.equalTo(Screen.bottomH())
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
class Panel005CellModel: Cat {
    
    var name:String?
    var image:UIImage?

}
class Panel005CellHolder: Holder {
    var textOb = Observe()
    var imageOb = Observe()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is Panel005CellModel{
            let a = amodel as! Panel005CellModel
            
            textOb.v_text { () -> String? in
                
                return a.name
            }
            
            imageOb.v_image { () -> UIImage? in
                
                return a.image
            }
            
        }
    }
    
    
}
