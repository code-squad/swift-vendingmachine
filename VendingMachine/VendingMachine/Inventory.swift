//
//  Inventory.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
// 물품 목록
class Inventory {
    
    private var list: [ObjectIdentifier: Packages]
    
    init(list: [ObjectIdentifier: Packages]) {
        self.list = list
    }
    
    func add(beverage: Beverage) {
        let beverageType = ObjectIdentifier(type(of: beverage))
        if let package = list[beverageType] {
            package.add(beverage: beverage)
            return
        }
        list[beverageType] = Packages(beverages: [beverage])
        print(list)
    }
    
}


