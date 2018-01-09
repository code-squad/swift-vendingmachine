//
//  Coffee.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let menu: Menu
    
    init(_ menu: Menu, _ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ expiryDate: Date) {
        self.menu = menu
        super.init(brand: brand, volume: volume, price: price, productName: productName, expiryDate: expiryDate)
    }
    
    override var description: String {
        return "\(self.menu.description) - \(super.description)"
    }
}

extension Coffee {
    enum Menu: CustomStringConvertible {
        case cantata, top, georgia
        
        var description: String {
            switch self {
            case .cantata:
                return "칸타타"
            case .top:
                return "TOP"
            case .georgia:
                return "조지아"
            }
        }
    }
}
