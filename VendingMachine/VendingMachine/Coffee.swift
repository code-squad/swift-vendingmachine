//
//  Coffee.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    override var type: String {
        return "커피"
    }
    override init(brand: String, weight: Int, price: Int, name: String, MFDDate: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, MFDDate: MFDDate)
    }

}

