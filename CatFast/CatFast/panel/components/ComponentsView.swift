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
    var menuArray = Observe()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // Do any additional setup after loading the view.
        self.backgroundColor = UIColor.clear
        
        self.frame = CGRect.init(x: 0, y: 0, width: Screen.width(), height: Screen.height())
        
        
        
        let menu = TopMenuView()
        self.addSubview(menu)
        
        menu.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(-(Screen.height()/3 + 30))
            make.height.equalTo(50)
        }
        menu.obArray.v_array(false) { () -> Array<Cat>? in
            
            var array = Array<Cat>()
            for i in 1...6{
                
                let m = TopMenuCellModel()
                m.name = "wyycom\(i)"
                array.append(m)
                
            }
            return array
        }
        menu.obIndex.v_index { (index) in
            
            
            
        }
        
        
        let flow = CCustomLayout.init( .vertical)
        let table = CCollection.init( flow)
        table.backgroundColor = Color.red()
        self.addSubview(table)
        
        table.v_array(ob: obArray)
        table.register([Com001Cell.classForCoder()])
        table.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(Screen.height()/3 + 30)
        }
        
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
        for i in 0...5{
            
            let m = Com001CellModel()
            m.name = "wyy\(i)"
            if i == 0 || i == 2 || i == 4{
                m.rect = CGRect.init(x: 0, y: 100 * (i/2) , width: 100, height: 100)

            }else{
                m.rect = CGRect.init(x: 100, y: 100 * (i/2), width: 100, height: 100)

            }
            array.append(m)
            
            
        }
        
        
        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
        
        
        
    }
    
    
}

