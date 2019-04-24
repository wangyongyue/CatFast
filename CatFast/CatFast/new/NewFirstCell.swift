//
//  NewFirstCell.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class NewFirstCell: CollectionTemplate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imgStyle = Style().x(0).y(0).width(Screen.width()/3 - 20).height(Screen.width()/3 - 20).backgroundColor(Color.white())
        let headerImg = CImageView(imgStyle)
        self.contentView.addSubview(headerImg)
        
        
        let labelStyle = Style().x(0).y(100).width(Screen.width()/3 - 20).height(30).text("test").textColor(Color.black())
        let headerLabel = CLabel(labelStyle)
        self.contentView.addSubview(headerLabel)
        
    
        
    }
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class NewFirstCellModel: Cat {
    override init() {
        super.init()
        v_palm = "NewFirstCell"
    }
    var name:String?
    var image:UIImage?
    
}
