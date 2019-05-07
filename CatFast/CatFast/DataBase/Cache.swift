//
//  Cache.swift
//  CatFast
//
//  Created by apple on 2019/5/7.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit
import JRDB
class Cache: NSObject {
    
    
   

}
class App:NSObject,JRPersistent{
    
  
    
    
    @objc var subId:Int = 0
    @objc var currentId:Int = 0
    
    @objc var content:String?
    @objc var navigation:String?
    @objc var tabBar:String?
    @objc var bottom:String?
    
    @objc var navigationLayout:String?
    @objc var contentLayout:String?
    @objc var tabBarLayout:String?
    @objc var bottomLayout:String?
    
    @objc var rootVC:String?
    @objc var panelVC:String?
    
  

}
