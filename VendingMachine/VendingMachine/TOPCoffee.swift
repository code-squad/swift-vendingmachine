//
//  TOPCoffee.swift
//  VendingMachine
//
//  Created by jang gukjin on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class TOPCoffee: Coffee {
    static let arbicaBeansContent: Bool = true
    
    init(){
        super.init(capacity: 1000, price: 4000, name: "T.O.P", stringDate: "20191122", temperature: 70)
    }
}
