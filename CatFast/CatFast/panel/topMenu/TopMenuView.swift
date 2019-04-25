//
//  TopMenuView.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class TopMenuView: CView {

    var obArray = Observe()
    var obIndex = Observe()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // Do any additional setup after loading the view.
        self.backgroundColor = UIColor.white
        
        let flow = CFlowLayout.init(CGSize.init(width: 100, height: 50), .horizontal)
        let table = CCollection.init( flow)
        table.backgroundColor = Color.clear()
        self.addSubview(table)
        table.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
        }
        
        table.v_array(ob: obArray)
        table.register([TopMenuCell.classForCoder()])
        
       
        table.v_index(ob: obIndex)
        
       
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
