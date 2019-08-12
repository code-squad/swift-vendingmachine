//
//  TOPCoffee.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class TOPCoffee: Coffee {
    let caffeineContent: Int
    
    init(caffeineContent: Int) {
        self.caffeineContent = caffeineContent
        
        super.init(
            brand: "맥심커피",
            capacity: 400,
            price: 3000,
            name: "TOP아메리카노",
            dateOfManufactured: Date("20190812"),
            temperature: 10
        )
    }
}
