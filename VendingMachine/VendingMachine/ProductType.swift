//
//  ProductType.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum ProductType: String {
    case Coke
    case Sprite
    case TOP
    case Cantata
    case Georgia
    case StrawberryMilk
    case ChocoMilk
    
    var price: Int {
        switch self {
        case .Coke:
            return 1000
        case .Sprite:
            return 1000
        case .TOP:
            return 1500
        case .Cantata:
            return 1200
        case .Georgia:
            return 900
        case .StrawberryMilk:
            return 1300
        case .ChocoMilk:
            return 1300
        }
    }
}
