//
//  ComponentsView.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class ComponentsView: CView {

    var obArray = Observe()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // Do any additional setup after loading the view.
        self.backgroundColor = UIColor.white
        
        
        let menu = TopMenuView()
        menu.frame = CGRect.init(x: 0, y: 0, width: Screen.width(), height: 30)
        self.addSubview(menu)
        
        menu.obIndex.v_index { (index) in
            
            
            
        }
        
        
        let flow = CFlowLayout.init(CGSize.init(width: Screen.width()/3, height: Screen.width()/3 + 30), .horizontal)
        let table = CCollection.init(frame: CGRect.init(x: 0, y: 0, width: Screen.width(), height:  Screen.width()/3 + 30), collectionViewLayout: flow)
        table.backgroundColor = Color.red()
        self.addSubview(table)
        
        table.v_array(ob: obArray)
        table.register([NewCell.classForCoder(),NewFirstCell.classForCoder(),NewLastCell.classForCoder()])
        
        let m = Components()
        m.loadData(ob: self.obArray)
        
        
        table.v_didSelect { (index) in
            
            
        }
        
        table.v_didEvent { (model) in
            
            
        }
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    
}
class Components:NSObject{
    
    func loadData(ob:Observe?){
        
        
        var array = Array<Cat>()
        for i in 1...6{
            
            let m = NewCellModel()
            m.name = "wyy\(i)"
            array.append(m)
            
            
        }
        
        
        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
        
        
        
    }
    
    
}

