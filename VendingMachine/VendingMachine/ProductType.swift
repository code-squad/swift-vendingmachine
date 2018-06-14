//
//  ProductType.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum ProductType: String, Hashable, Equatable {
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
    
    // 1 day == 86400 sec
    // n day == n * 86400 sec
    var expiratation: TimeInterval {
        switch self {
        case .Coke:
            return 10 * 86400
        case .Sprite:
            return 10 * 86400
        case .TOP:
            return 5 * 86400
        case .Cantata:
            return 5 * 86400
        case .Georgia:
            return 5 * 86400
        case .StrawberryMilk:
            return 3 * 86400
        case .ChocoMilk:
            return 3 * 86400
        }
    }
    
}
