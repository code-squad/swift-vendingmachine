//
//  Soda.swift
//  VendingMachine
//
//  Created by jang gukjin on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Soda: Product {
    init(capacity: Int, price: Int, name: String, stringDate: String) {
        super.init(brand: "팹시", capacity: capacity, price: price, name: name, stringDate: stringDate)
    }
}
