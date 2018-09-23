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
        let inventory = Inventory.init()
        inventory.inventoryInformation()
    }
}

VendingMachine.run()
