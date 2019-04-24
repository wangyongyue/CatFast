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
        
        let flow = CFlowLayout.init(CGSize.init(width: 60, height: 30), .horizontal)
        let table = CCollection.init(frame: CGRect.init(x: 0, y: 100, width: Screen.width(), height:  30), collectionViewLayout: flow)
        table.backgroundColor = Color.red()
        self.addSubview(table)
        
        table.v_array(ob: obArray)
        table.register([TopMenuCell.classForCoder()])
        
        let m = TopMenu()
        m.loadData(ob: self.obArray)
        
        table.v_index(ob: obIndex)
        
       
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
class TopMenu:NSObject{
    
    func loadData(ob:Observe?){
        
        
        var array = Array<Cat>()
        for i in 1...6{
            
            let m = TopMenuCellModel()
            m.name = "wyy\(i)"
            array.append(m)
            
        }
        
        
        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
        
        
        
    }
    
    
}
