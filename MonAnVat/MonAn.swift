//
//  MonAn.swift
//  MonAnVat
//
//  Created by Chung on 9/9/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit
class MonAn {
    
    var name: String!
    var photo: UIImage!
    var des: String!
    
    init(name: String , photo: String, des: String)
    {
        self.name = name
        self.photo = UIImage(named: "\(photo).jpg")
        self.des = des
    }
}
