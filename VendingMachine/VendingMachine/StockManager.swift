//
//  StockManager.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct StockManager {
    
    private var stock: [ProductType:[Beverage]]!
    
    init(stock: [ProductType:[Beverage]]) {
        self.stock = stock
    }
}
