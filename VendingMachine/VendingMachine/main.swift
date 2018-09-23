//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    static func run(){
        let inventory = Inventory()
        inventory.information()
        
        let customer = Customer()
        customer.charge(with: 10000)
    }
}

VendingMachine.run()
