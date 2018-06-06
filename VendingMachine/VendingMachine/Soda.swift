//
//  Soda.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Soda: Beverage<SodaFlavor> {
}


enum SodaFlavor: CustomStringConvertible {
    case coke
    case sprite
    case fanta
    
    var description: String {
        switch self {
        case .coke:
            return "콜라"
        case .sprite:
            return "사이다"
        case .fanta:
            return "환타"
        }
    }
}
