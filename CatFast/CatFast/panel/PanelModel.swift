//
//  PanelModel.swift
//  CatFast
//
//  Created by apple on 2019/5/5.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class PanelModel: NSObject {
    
    
    var subId:Int?
    var currentId:Int?
    
    var content:[Cat]?
    var navigation:[Cat]?
    var tabBar:[Cat]?
    var bottom:[Cat]?
    
    var navigationLayout:Cat?
    var contentLayout:Cat?
    var tabBarLayout:Cat?
    var bottomLayout:Cat?

    var rootVC:CViewController?
    var panelVC:CViewController?

    
    // subId:1
    // currentId:10000
    // content:{model,model}
    // nav:{model,model}
    // tabbar:{id,id}
    // bottom:{model,model}
    //
    //


}
