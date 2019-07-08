//
//  CantataCoffee.swift
//  VendingMachine
//
//  Created by jang gukjin on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CantataCoffee: Coffee {
    static let DripStatus: Bool = true
    
    init(temperature: Double){
        super.init(capacity: 280, price: 2400, name: "칸타타", stringDate: "20191225", temperature: temperature)
    }
}
