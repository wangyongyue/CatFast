//
//  Panel001VC.swift
//  CatFast
//
//  Created by apple on 2019/4/28.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Panel001VC: CViewController {

    let content = PanelContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = Color.backGray()
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.addSubview(content)
        
        content.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.centerY.equalToSuperview()
            make.bottom.equalTo(0)
            make.height.equalTo(Screen.height()/3*2)
        }
        let m = Tem001CellModel()
        self.content.loadData(m)
        
    }
    
    
    
}
