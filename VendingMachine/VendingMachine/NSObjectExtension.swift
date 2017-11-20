//
//  NSObjectExtension.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 20..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
    
    class var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    
    var typeName: String {
        var typeName = ""
        switch self {
        case is Milk:
            typeName = Milk.className()
        case is SoftDrink:
            typeName = SoftDrink.className()
        case is Coffee:
            typeName  = Coffee.className()
        default:
            typeName = self.className
        }
        return typeName
    }
}
