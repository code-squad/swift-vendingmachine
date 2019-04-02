//
//  Packages.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//패키지
class Packages {
    private var beverage: [Beverage]
    
    init(beverages: [Beverage]) {
        self.beverage = beverages
    }
    
    func add(beverage: Beverage) {
        self.beverage.append(beverage)
    }
    
}
