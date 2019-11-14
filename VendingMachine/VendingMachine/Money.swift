//
//  Money.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/11/14.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Money {
    private var value: Int = 0
    private var monetaryUnit: Unit = .won
    
    init() { }
    
    private init(value: Int) {
        self.value = value
    }
    
    enum Unit: CustomStringConvertible {
        case won, dollar, euro
        
        var description: String {
            switch self {
            case .won:
                return "원"
            case .dollar:
                return "달러"
            case .euro:
                return "유로"
            }
        }
    }
}

extension Money: CustomStringConvertible {
    var description: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let formattedMoney = numberFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
        
        return "\(formattedMoney)\(monetaryUnit)"
    }
}

extension Money: Comparable {
    static func < (lhs: Money, rhs: Money) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func < (lhs: Money, rhs: Int) -> Bool {
        return lhs.value < rhs
    }
    
    static func < (lhs: Int, rhs: Money) -> Bool {
        return lhs < rhs.value
    }
}

extension Money {
    static func + (lhs: Money, rhs: Money) -> Money {
        return Money(value: lhs.value + rhs.value)
    }
    
    static func + (lhs: Money, rhs: Int) -> Money {
        return Money(value: lhs.value + rhs)
    }
    
    static func - (lhs: Money, rhs: Money) -> Money {
        return Money(value: lhs.value - rhs.value)
    }
    
    static func - (lhs: Money, rhs: Int) -> Money {
        return Money(value: lhs.value - rhs)
    }
}
