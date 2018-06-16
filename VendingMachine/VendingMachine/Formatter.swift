//
//  Formatter.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Formatter {
    
    static func makeProductTypes(_ buyableProducts: [ProductType:Int]) -> [ProductType] {
        return Array(buyableProducts.keys)
    }
    
    static func makeProductType(_ input: Int, _ productTypeList: [ProductType]) -> ProductType {
        let index = input - 1
        return productTypeList[index]
    }
}
