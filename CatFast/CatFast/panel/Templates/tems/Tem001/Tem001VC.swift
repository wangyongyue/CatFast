//
//  Tem001VC.swift
//  CatFast
//
//  Created by apple on 2019/4/25.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Tem001VC: CViewController {

    var obArray = Observe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let flow = CCustomLayout.init(CGSize.init(width: Screen.width() / 2, height: Screen.width() / 2), .vertical)
        let table = CCollection.init(frame: CGRect.init(x: 0, y: 100, width: Screen.width(), height:  Screen.width()/3 + 30), collectionViewLayout: flow)
        table.backgroundColor = Color.red()
        self.view.addSubview(table)
        
        table.v_array(ob: obArray)
        table.register([Tem001Cell.classForCoder()])
        
        let m = Tem001()
        m.loadData(ob: self.obArray)
        
        table.v_didSelect { (index) in
            
            print(index)
            Router.push(PanelVC(), ["id":10], { (obj) in
                print(obj)
            })
            
        }
        
        table.v_didEvent { (model) in
            
            
        }
        
        
    }
    
    
}
class Tem001:NSObject{
    
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
