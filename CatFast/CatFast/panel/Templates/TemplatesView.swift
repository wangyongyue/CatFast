//
//  TemplatesView.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit
class TemplatesView: CView {

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

        
        let flow = CFlowLayout.init(CGSize.init(width: Screen.width()/3, height: Screen.width()/3 + 30), .vertical)
        let table = CCollection.init( flow)
        table.backgroundColor = Color.red()
        self.addSubview(table)
        
        table.v_array(ob: obArray)
        table.register([Tem001Cell.classForCoder()])

        table.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.center.equalToSuperview()
            make.height.equalTo(200)
        }
        
        let m = Templates()
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
class Templates:NSObject{
    
    func loadData(ob:Observe?){
        
        
        var array = Array<Cat>()
        for i in 1...6{
            
            let m = Tem001CellModel()
            m.name = "wyy\(i)"
            array.append(m)
            
            
        }
        
        
        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
        
        
        
    }
    
    
}

