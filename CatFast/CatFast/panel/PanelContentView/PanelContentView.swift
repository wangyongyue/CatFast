//
//  PanelContentView.swift
//  CatFast
//
//  Created by apple on 2019/4/27.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class PanelContentView: CView {

    var obArray = Observe()
    let m = Panel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
  
    
    func loadData(_ model:Cat?){
        
        
        
        let flow = ClassType.getLayoutHorizontalClass(model)
        if let a = flow{
            
            setupContent(layout: a)
            let m = Panel()
            m.loadData(ob: obArray)
        }
        
     
    }
    func loadSmallData(_ model:Cat?){
        
       
        
        let flow = ClassType.getLayoutHorizontalClass(model)
        if let a = flow{
            
            setupContent(layout: a)
            let m = Panel()
            m.loadSmallData(ob: obArray)
        }
        
        
        
    }
   
    func setupContent(layout:CCustomLayout){
        
        
        let table = CCollection.init( layout)
        self.addSubview(table)
        table.backgroundColor = Color.backGray()
        table.v_array(ob: obArray)
        
        var classArray = Array<AnyClass>()
        for i in 1...comNumber{
            
            let classType = ClassType.getCellClass("Com", i)
            if let type = classType{
                
                classArray.append(type)
                
            }
        }
        
        table.register(classArray)
        
        
        table.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
           
        }
        
        let t =  ComponentsView()
        let tem =  PanelsView()
        
        
        var aIndex = 0
        table.v_didSelect { (index) in
            aIndex = index
            let model = self.obArray.v_array?[index]
            if let m = model{
                if m is PanelAddCellModel || m is PanelAddSmallModel || m is PanelAddContentModel{
                    
                    CWindow.init(true).addSubview(t)
                    
                }else{
                    
                    
                    let array = Global.share.array
                    if array.count > 0{
                        
                        for value in array{
                            if value.currentId == Router.currentController().model.subId{
                                
                                if let vc = value.panelVC{
                                    
                                    Router.push(vc, ["id":10], { (obj) in
                                        
                                        print(obj)
                                        
                                    })
                                    return
                                }
                            }
                        }
                        
                        
                    }
                   
                    
                    
                    CWindow.init(true).addSubview(tem)
                }
            }
            
        }
        t.obIndex.v_index { (index) in
            
            let model = t.obArray.v_array?[index]
            if let m = model{
                
                self.obArray.v_array?.remove(at: aIndex)
                self.obArray.v_array?.insert(m, at: aIndex)
                
                if let array = self.obArray.v_array{
                    self.obArray.v_array(false, v: { () -> Array<Cat>? in
                        
                        return array
                    })
                }
                
                
            }
            
            t.remove()
        }
        tem.obIndex.v_index { (index) in
            
            
            let m = tem.obArray.v_array?[index]
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
            
            let currentId = Router.currentController().model.currentId
            if let a = currentId{
                vc.model.currentId = a + 1
                Router.currentController().model.subId = a + 1
                
                Global.share.array.append(vc.model)

            }
            
            Router.push(vc, ["id":10], { (obj) in
                
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
            
            let m = PanelAddContentModel("PanelAddContentCell")
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
