//
//  CTabBarController.swift
//  CatFast
//
//  Created by apple on 2019/5/5.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class CTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
    }

}
