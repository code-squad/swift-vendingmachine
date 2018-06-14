//
//  History.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 14..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct History: Equatable {
    
    private var purchased: [Beverage]
    
    init(purchased: [Beverage]) {
        self.purchased = purchased
    }
    
    mutating func addPurchased(_ beverage: Beverage) {
        self.purchased.append(beverage)
    }
    
    func readPurchased() -> [Beverage] {
        return self.purchased
    }
}
