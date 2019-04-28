//
//  PanelTabBarView.swift
//  CatFast
//
//  Created by apple on 2019/4/27.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class PanelTabBarView: CView {

    var obArray = Observe()
    let m = PanelTabBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContent()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func loadData(){
        
        
        m.loadData(ob: obArray)
        
    }
    func loadSmallData(){
        
        m.loadSmallData(ob: obArray)
    }
    func setupContent(){
        
        let flow = Tab001Layout.init( .vertical)
        let table = CCollection.init( flow)
        self.addSubview(table)
        table.backgroundColor = Color.white()
        table.bounces = false
        table.v_array(ob: obArray)
        
        table.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)

        }
        
        var classArray = Array<AnyClass>()
        for i in 1...comNumber{
            
            let classType = ClassType.getCellClass("Com", i)
            if let type = classType{
                
                classArray.append(type)
                
            }
        }
        
        
        
        let t =  TabBarsView()
        let tem =  PanelsView()
        
        var aIndex = 0
        table.v_didSelect { (index) in
            aIndex = index
            let model = self.obArray.v_array?[index]
            if let m = model{
                if m is PanelAddCellModel || m is PanelAddSmallModel {

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
            
            Router.push(PanelDefaultVC(), ["id":10], { (obj) in
                
                print(obj)
                
            })
            tem.remove()
            
        }
        
        table.v_didEvent { (model) in
            
            
        }
        
        
    }
}
class PanelTabBar:NSObject{
    
    func loadData(ob:Observe?){
        
        var array = Array<Cat>()
        for i in 1...dataNumber{
            
            let m = PanelAddCellModel("PanelAddCell")
            m.name = "wyy\(i)"
            array.append(m)
            
        }
        
        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
    }
    func loadSmallData(ob:Observe?){
        
        var array = Array<Cat>()
        for i in 1...dataNumber{
            
            let m = PanelAddSmallModel("PanelAddSmallCell")
            m.name = "wyy\(i)"
            array.append(m)
            
        }
        
        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
    }
    
    
}
