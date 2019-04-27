//
//  Color.swift
//  CatFast
//
//  Created by apple on 2019/4/24.
//  Copyright © 2019 wangyongyue. All rights reserved.
//

import UIKit

class Color: NSObject {

    static func white() -> UIColor{
        
       return UIColor.white
    }
    static func black() -> UIColor{
        
        return UIColor.black
    }
    static func red() -> UIColor{
        
        return UIColor.red
    }
    static func yellow() -> UIColor{
        
        return UIColor.yellow
    }
    static func clear() -> UIColor{
        
        return UIColor.clear
    }
    
    class func backGray() -> UIColor{
        return Color.rgb(248,248,248)
    }
    class func textGray() -> UIColor{
        return Color.rgb(153,153,153)
        
    }
    class func gray() -> UIColor{
        return UIColor.darkGray
        
    }
}
extension Color{
    
    
    class func color16ToRGB(color_vaule : String , alpha : CGFloat = 1) -> UIColor {
        if color_vaule.isEmpty {
            return UIColor.clear
            
        }
        var cString = color_vaule.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        if cString.count == 0 {
            return UIColor.clear
            
        }
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
            
        }
        if cString.count < 6 && cString.count != 6 {
            return UIColor.clear
            
        }
        let value = "0x\(cString)"
        let scanner = Scanner(string:value)
        var hexValue : UInt64 = 0
        let newValue:Int? = Int(color_vaule)
        //查找16进制是否存在
        if scanner.scanHexInt64(&hexValue) {
            
            if let new = newValue {
                let redValue = CGFloat((new  & 0xFF0000) >> 16)/255.0
                let greenValue = CGFloat((new & 0xFF00) >> 8)/255.0
                let blueValue = CGFloat(new & 0xFF)/255.0
                return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
                
            }
            
        }
        
        return UIColor.clear
        
    }
    
    class func rgb(_ r : CGFloat ,_ g : CGFloat ,_ b : CGFloat , alpha : CGFloat = 1) -> UIColor {
        
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha);
    }
    class func rgba(_ r : CGFloat ,_ g : CGFloat ,_ b : CGFloat , _ alpha : CGFloat = 1) -> UIColor {
        
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha);
    }
    
    
}
