//
//  NewVC.swift
//  CatFast
//
//  Created by wangyongyue on 2019/4/23.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit
import SnapKit
class NewVC: CViewController {

    var obArray = Observe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let flow = CFlowLayout.init(CGSize.init(width: 200, height: 200), .horizontal)
        let table = CCollection.init(flow)
        table.backgroundColor = Color.red()
        self.view.addSubview(table)

        table.v_array(ob: obArray)
        table.register([NewCell.classForCoder(),NewFirstCell.classForCoder(),NewLastCell.classForCoder()])

        table.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.center.equalToSuperview()
            make.height.equalTo(200)
        }
        
        let m = Main()
        m.loadData(ob: self.obArray)

        
        
        table.v_didSelect { (index) in

            print(index)
            
//            let className = "CatFast.PanelVC"
//            if let classType = NSClassFromString(className) as? CViewController.Type {
//
//                let vc = classType.init()
//                self.navigationController?.pushViewController(vc, animated: true)
//
//            }
            
            
            
            
            
            
            Router.push(PanelVC(), ["id":10], { (obj) in
                print(obj)
            })
            
        }

        table.v_didEvent { (model) in


        }
        
        
    }
    
    
}
class Main:NSObject{
    
    func loadData(ob:Observe?){
        
        
        var array = Array<Cat>()
        for i in 1...6{
            
            if i == 1{
                let m = NewFirstCellModel()
                m.name = "wyy\(i)"
                array.append(m)
                
            }else if i == 6{
                let m = NewLastCellModel()
                m.name = "wyy\(i)"
                array.append(m)
                
            }else{
                
                let m = NewCellModel()
                m.name = "wyy\(i)"
                array.append(m)
                
            }
            
            
        }
        
        
        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
        
        
        
    }
    
    
}

