//
//  Bundles.swift
//  VendingMachine
//
//  Created by 이동건 on 23/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Bundle {
    private var list: (beverage: Beverage, count: Int)
    var beverage: Beverage {
        return list.beverage
    }
    var count: Int {
        return list.count
    }
    
    init(list: (beverage: Beverage, count: Int)) {
        self.list = list
    }
}
