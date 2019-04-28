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
let panelNumber = 5
let comNumber = 10

let comNavNumber = 10
let comTabNumber = 10


let navNumber = 5
let tabNumber = 5

let dataNumber = 16


class NewVC: CViewController {

    var obArray = Observe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        CCollection.templates.append(PanelAddCell.classForCoder())
        CCollection.templates.append(PanelAddSmallCell.classForCoder())

        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        let flow = CFlowLayout.init(CGSize.init(width: 200, height: 200), .horizontal)
        let table = CCollection.init(flow)
        self.view.addSubview(table)
        table.backgroundColor = Color.backGray()
        table.bounces = false

        table.v_array(ob: obArray)
        table.register([NewCell.classForCoder(),NewFirstCell.classForCoder(),NewLastCell.classForCoder()])

        table.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.center.equalToSuperview()
            make.height.equalTo(200)
        }
        
        let m = Main()
        m.loadData(ob: self.obArray)

        let t =  PanelsView()
        t.obIndex.v_index { (index) in
            
            let m = t.obArray.v_array?[index]
            var vc = CViewController()
            
            if m is Panel001CellModel{
                vc = Panel001VC()
            }else if m is Panel002CellModel{
                vc = Panel002VC()
            }else if m is Panel003CellModel{
                vc = Panel003VC()
            }else if m is Panel004CellModel{
                vc = Panel004VC()
            }else if m is Panel005CellModel{
                vc = Panel005VC()
            }
          
            
            Router.push(vc, ["id":10], { (obj) in
                
                print(obj)
                
            })
            t.remove()
        }

        table.v_didSelect { (index) in

            print(index)
            

            let m = self.obArray.v_array?[index]
            if m is NewCellModel{
                

            }else if m is NewLastCellModel{
                
                CWindow.init(true).addSubview(t)

            }
            
            
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
                let m = NewLastCellModel("NewLastCell")
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

