//
//  Milk.swift
//  VendingMachine
//
//  Created by 윤동민 on 21/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum MilkKind {
    case choco
    case strawberry
    case banana
}

class Milk: Beverage {
    var kind: MilkKind
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, milkKind: MilkKind) {
        self.kind = milkKind
        super.init(name: name, volume: volume, price: price, brand: brand, date: date)
    }
}
