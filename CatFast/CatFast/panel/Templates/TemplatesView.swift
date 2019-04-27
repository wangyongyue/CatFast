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
                m.name = "template\(i)"
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
        for i in 1...temNumber{
            
            let classType = ClassType.getCellClass("Tem", i)
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
        
        let m = Templates()
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
class Templates:NSObject{
    
    func loadData(ob:Observe?){
        
        
        var array = Array<Cat>()
        for i in 1...temNumber{
            
            let m  = ClassType.getCatClass("Tem", i)
            if let a = m{
                array.append(a)
            }
          
        }
        
        
        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
        
        
        
    }
    
    
}

