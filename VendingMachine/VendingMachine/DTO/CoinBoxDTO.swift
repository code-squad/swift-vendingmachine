//
//  AddCoinDTO.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class CoinBox: VendingMachineUser {
    private(set) var amount: Int
    
    init(amount: Int) {
        self.amount = amount
        super.init()
        super.ModeOfUsers = 1
    }
}
