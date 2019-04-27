//
//  CWindow.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CWindow: UIView {

    var disappear = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let window = UIApplication.shared.keyWindow
        if let w = window{
            
            self.backgroundColor = UIColor.clear
            self.frame = w.bounds
            w.addSubview(self)
        }
    }
    convenience init(_ disappear:Bool,_ backColor:UIColor = UIColor.clear){
        self.init()
        self.disappear = disappear
        self.backgroundColor = backColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.disappear{
            self.removeFromSuperview()

        }
    }

}
class Screen{
    
    static func width() -> CGFloat{
        
        return UIScreen.main.bounds.width
    }
    static func height() -> CGFloat{
        
        return UIScreen.main.bounds.height
    }
    static func top() -> CGFloat{
        let top = phoneH(iphone5: 64, iphone6: 64, iphoneS: 64, iphoneX: 64+24)

        return top
    }
    static func bottom() -> CGFloat{
        let top = phoneH(iphone5: -49, iphone6: -49, iphoneS: -49, iphoneX: -49 - 24)
        return top
    }
   
    static func bottomH() -> CGFloat{
        let top = phoneH(iphone5: 49, iphone6: 49, iphoneS: 49, iphoneX: 49+24)
        return top
        
    }
    
    static func phoneH(iphone5:CGFloat,iphone6:CGFloat,iphoneS:CGFloat,iphoneX:CGFloat)-> CGFloat{
        
        let h = UIScreen.main.bounds.size.height
        
        if h == 568 {
            return iphone5
            
        }else if h == 667 {
            return iphone6
            
        }else if h == 736 {
            return iphoneS
            
        }else if h == 812 {
            return iphoneX
            
        }else {
            return iphoneX
            
        }
        
    }
}
extension UIView{
    
    func width() -> CGFloat{
        
        return self.bounds.width
    }
    func height() -> CGFloat{
        
        return self.bounds.height
    }
}
