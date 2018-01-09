//
//  CarbonatedDrink.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class CarbonatedDrink: Beverage {
    private let menu: Menu
    
    init(_ menu: Menu, _ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ expiryDate: Date) {
        self.menu = menu
        super.init(brand: brand, volume: volume, price: price, productName: productName, expiryDate: expiryDate)
    }
    
    override var description: String {
        return "\(self.menu.description) - \(super.description)"
    }
}

extension CarbonatedDrink {
    enum Menu: CustomStringConvertible {
        case cola, sprite, fanta
        
        var description: String {
            switch self {
            case .cola:
                return "콜라"
            case .sprite:
                return "스프라이트"
            case .fanta:
                return "환타"
            }
        }
    }
}
