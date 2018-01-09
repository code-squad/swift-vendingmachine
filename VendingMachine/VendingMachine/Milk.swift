//
//  Coffe.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private let menu: Menu
    
    init(_ menu: Menu, _ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ expiryDate: Date) {
        self.menu = menu
        super.init(brand: brand, volume: volume, price: price, productName: productName, expiryDate: expiryDate)
    }
    
    override var description: String {
        return "\(self.menu.description) - \(super.description)"
    }
}

extension Milk {
    enum Menu: CustomStringConvertible {
        case banana, strawberry, choco
        
        var description: String {
            switch self {
            case .banana:
                return "바나나우유"
            case .strawberry:
                return "딸기우유"
            case .choco:
                return "초코우유"
            }
        }
    }
}
