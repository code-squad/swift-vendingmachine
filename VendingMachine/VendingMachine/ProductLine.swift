//
//  ProductLine.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 19..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct ProductLine {
    private var products: [Beverage] = []
    
    mutating func add(product:Beverage) {
        self.products.append(product)
    }
}
