//
//  StockManager.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct BeverageBox {
    private let _beverageMenu: BeverageMenu
    private let _quantity: Int
    
    init(beverageMenu: BeverageMenu, quantity: Int) {
        self._beverageMenu = beverageMenu
        self._quantity = quantity
    }
    
    var beverageMenu: BeverageMenu {
        return self._beverageMenu
    }
    
    var quantity: Int {
        return self._quantity
    }
}
