//
//  StockManager.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct BeverageBox {
    private(set) var beverageMenu: BeverageMenu
    private(set) var quantity: Int
    
    init(beverageMenu: BeverageMenu, quantity: Int) {
        self.beverageMenu = beverageMenu
        self.quantity = quantity
    }
}
