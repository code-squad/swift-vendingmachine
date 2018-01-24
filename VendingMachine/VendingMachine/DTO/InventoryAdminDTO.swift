//
//  AdminDTO.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InventoryAdmin {
    private(set) var modeOfAdmin: Int
    private(set) var menuNumber: Int
    private(set) var numberOfTheBeverage: Int
    
    init() {
        self.modeOfAdmin = 0
        self.menuNumber = 0
        self.numberOfTheBeverage = 0
    }
    init(modeOfAdmin: Int, menuNumber: Int, numberOfTheBeverage: Int) {
        self.modeOfAdmin = modeOfAdmin
        self.menuNumber = menuNumber
        self.numberOfTheBeverage = numberOfTheBeverage
    }
}
