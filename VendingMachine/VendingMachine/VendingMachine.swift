//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    
    private var balance: Int = 0
    private var stock: [ProductType:[Beverage]]!
    
    init(stock: [ProductType:[Beverage]]) {
        self.stock = stock
    }
    
    mutating func insertMoney(_ price: Int) {
        self.balance += price
    }
    
    func readBalance() -> String {
        return "\(self.balance)원"
    }
    
    func add(beverage: Beverage) {
        
    }
    
    enum ProductType: String {
        case Coke
        case Sprite
        case TOP
        case Cantata
        case Georgia
        case StrawberryMilk
        case ChocoMilk
    }
}
