//
//  BeveragePurchaseDTO.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class BeveragePurchase: VendingMachineUser {
    private(set) var beverageMenu: Int

    init(beverageMenu: Int) {
        self.beverageMenu = beverageMenu
        super.init()
        super.modeOfUsers = 2
    }
}
