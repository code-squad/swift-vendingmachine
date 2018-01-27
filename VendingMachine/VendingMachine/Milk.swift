//
//  Milk.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var flavor: String
    override var type: String {
        return "\(flavor)우유"
    }

    init(flavor: String, brand: String, weight: Int, price: Int, name: String, MFDDate: String) {
        self.flavor = flavor
        super.init(brand: brand, weight: weight, price: price, name: name, MFDDate: MFDDate)
    }

}
