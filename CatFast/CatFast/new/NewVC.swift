//
//  NewVC.swift
//  CatFast
//
//  Created by wangyongyue on 2019/4/23.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit
import SnapKit

let appName = "CatFast."
let temNumber = 10
let layoutNumber = 10
let comNumber = 10
let dataNumber = 16


class NewVC: CViewController {

    var obArray = Observe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        CCollection.templates.append(PanelAddCell.classForCoder())
        
        
        
        
        
        
        
        
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

        
        let t =  TemplatesView()
        t.obIndex.v_index { (index) in
            
            print(index)
            Router.push(PanelVC(), ["id":10], { (obj) in
                
                print(obj)
            })
            t.remove()
        }

        table.v_didSelect { (index) in

            print(index)
            
//            let className = "CatFast.PanelVC"
//            if let classType = NSClassFromString(className) as? CViewController.Type {
//
//                let vc = classType.init()
//                self.navigationController?.pushViewController(vc, animated: true)
//
//            }
            
            
            
            CWindow.init(true).addSubview(t)

            
            
           
            
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
                let m = NewFirstCellModel("NewFirstCell")
                m.name = "wyy\(i)"
                array.append(m)
                
            }else if i == 6{
                let m = NewLastCellModel("NewFirstCell")
                m.name = "wyy\(i)"
                array.append(m)
                
            }else{
                
                let m = NewCellModel("NewCell")
                m.name = "wyy\(i)"
                array.append(m)
                
            }
            
            
        }
        
        
        ob?.v_array(true, v: { () -> Array<Cat>? in
            
            return array
        })
        
        
        
    }
    
    
}

