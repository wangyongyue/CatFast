//
//  PanelVC.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class PanelVC: CViewController {

    
    var obArray = Observe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let flow = Tem001Layout.init( .horizontal)
        let table = CCollection.init( flow)
        self.view.addSubview(table)
        
        table.v_array(ob: obArray)
        table.register([Tem001Cell.classForCoder()])
        
        table.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(Screen.bottom())
            make.top.equalTo(Screen.top())
        }
        
        
        let m = Panel()
        m.loadData(ob: self.obArray)
        
        let t =  ComponentsView()
        let tem =  TemplatesView()

        var aIndex = 0
        table.v_didSelect { (index) in
            aIndex = index
            let model = self.obArray.v_array?[index]
            if let m = model{
                if m is PanelAddCellModel{
                    
                    CWindow.init(true).addSubview(t)

                }else{
                    
                    CWindow.init(true).addSubview(tem)

                }
            }
            
            
            
        }
        t.obIndex.v_index { (index) in
            
            print(index)
            let model = t.obArray.v_array?[index]
            if let m = model{
                
                self.obArray.v_array?.remove(at: aIndex)
                self.obArray.v_array?.insert(m, at: aIndex)
                
            }
           
            t.remove()
        }
        tem.obIndex.v_index { (index) in
            
            Router.push(PanelVC(), ["id":10], { (obj) in
                
                print(obj)
            })
            tem.remove()
            
        }
        
        table.v_didEvent { (model) in
            
            
        }
        
        
    }
    
    
}
class Panel:NSObject{
    
    func loadData(ob:Observe?){
        
        
        var array = Array<Cat>()
        for i in 1...dataNumber{
            
            let m = PanelAddCellModel("Tem001Cell")
            m.name = "wyy\(i)"
            array.append(m)
            
        }
        
        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
        
        
        
    }
    
    
}

//{
//    "data": [{
//    "layout": "Tem001Layout",
//    "title": "title",
//    "navigation": "title",
//    "tabBar": "title",
//    "topMenu": "title",
//    "bottomMenu": "title",
//    "array": [{
//    "model": "Com001CellModel",
//    "data": {
//    "name": "wyy",
//    "age": "wyy",
//    "sex": "wyy"
//    }
//    }]
//    }]
//}
