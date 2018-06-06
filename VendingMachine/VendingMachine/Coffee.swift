//
//  Coffee.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage<CoffeeFlavor> {
}

enum CoffeeFlavor: CustomStringConvertible {
    case top
    case georgia
    case cantata
    
    var description: String {
        switch self {
        case .top:
            return "TOP"
        case .georgia:
            return "조지아"
        case .cantata:
            return "칸타타"
        }
    }
}
