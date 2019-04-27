//
//  SectionsView.swift
//  CatFast
//
//  Created by apple on 2019/4/27.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class SectionsView: CView {
    var obArray = Observe()
    var obIndex = Observe()
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
                
                let m = TopMenuCellModel("TopMenuCell")
                m.name = "section\(i)"
                array.append(m)
                
            }
            return array
        }
        
        
        menu.obIndex.v_index { (index) in
            
            
            
        }
        
        
        let flow = CFlowLayout.init(CGSize.init(width: Screen.width()/3, height: Screen.height()/3), .vertical)
        let table = CCollection.init( flow)
        self.addSubview(table)
        table.backgroundColor = Color.backGray()
        
        table.v_array(ob: obArray)
        
        var classArray = Array<AnyClass>()
        for i in 1...secNumber{
            
            let classType = ClassType.getCellClass("Sec", i)
            if let type = classType{
                
                classArray.append(type)
                
            }
        }
        
        table.register(classArray)
        
        
        
        table.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(Screen.height()/3 + 30)
        }
        
        let m = Sections()
        m.loadData(ob: self.obArray)
        
        table.v_index(ob: obIndex)
        
        
        //        table.v_didSelect { (index) in
        //
        //            self.obIndex.v_index?(index)
        //        }
        
        
        
    }
    func remove(){
        
        self.superview?.removeFromSuperview()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    
}
class Sections:NSObject{
    
    func loadData(ob:Observe?){
        
        
        var array = Array<Cat>()
        for i in 1...secNumber{
            
            let m  = ClassType.getCatClass("Sec", i)
            if let a = m{
                array.append(a)
            }
            //            let m = Com001CellModel()
            //            m.name = "wyy\(i)"
            //            array.append(m)
            
        }
        
        
        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
        
        
        
    }
    
    
}

