//
//  BeverageInfo.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 22..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct BeverageInfo {
    private let name: String
    private let price: Int
    private let BeverageCount: Int
    
    init(name: String, price: Int, BeverageCount: Int) {
        self.name = name
        self.price = price
        self.BeverageCount = BeverageCount
    }
}
