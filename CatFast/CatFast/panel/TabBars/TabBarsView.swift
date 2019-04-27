//
//  TabBarsView.swift
//  CatFast
//
//  Created by apple on 2019/4/27.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class TabBarsView: CView {
    var obArray = Observe()
    var obIndex = Observe()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // Do any additional setup after loading the view.
        self.backgroundColor = UIColor.clear
        
        self.frame = CGRect.init(x: 0, y: 0, width: Screen.width(), height: Screen.height())
        
        let flow = CFlowLayout.init(CGSize.init(width: Screen.width()/6, height: Screen.height()/6), .vertical)
        let table = CCollection.init( flow)
        self.addSubview(table)
        table.backgroundColor = Color.backGray()
        
        table.v_array(ob: obArray)
        
        var classArray = Array<AnyClass>()
        for i in 1...tabNumber{
            
            let classType = ClassType.getCellClass("Tab", i)
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
        
        let m = TabBars()
        m.loadData(ob: self.obArray)
        
        table.v_index(ob: obIndex)
        
        
        
        
    }
    func remove(){
        
        self.superview?.removeFromSuperview()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    
}
class TabBars:NSObject{
    
    func loadData(ob:Observe?){
        
        
        var array = Array<Cat>()
        for i in 1...tabNumber{
            
            let m  = ClassType.getCatClass("Tab", i)
            if let a = m{
                array.append(a)
            }
            
        }
        
        
        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
        
        
        
    }
    
    
}
