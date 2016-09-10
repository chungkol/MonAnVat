//
//  Manager.swift
//  MonAnVat
//
//  Created by Chung on 9/9/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import Foundation
class Manager {
    var data = NSMutableArray()
    
    class var sharedInstance: Manager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: Manager? = nil
        }
        dispatch_once(&Static.onceToken)
        {
            Static.instance = Manager()
            
            let filePath = NSBundle.mainBundle().pathForResource("monanvat", ofType: "plist")
            let raw = NSDictionary(contentsOfFile: filePath!)
            let temp = NSMutableArray(capacity: raw!.count)
            
            for item in raw!
            {
                let monAn = MonAn(name: item.value.valueForKey("name") as! String
                    , photo: item.value.valueForKey("photo") as! String, des: item.value.valueForKey("des") as! String)
                temp.addObject(monAn)
            }
            Static.instance?.data = NSMutableArray(array: temp)
            
        }
        return Static.instance!
    }
    
    
}