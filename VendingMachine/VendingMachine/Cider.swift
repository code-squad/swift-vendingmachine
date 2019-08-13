//
//  Cider.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Cider: SoftDrink {
    private let sugarContent: Int
    
    init(sugarContent: Int) {
        self.sugarContent = sugarContent
        
        super.init(
            brand: "코카콜라컴퍼니",
            capacity: 250,
            price: 1900,
            name: "스프라이트",
            dateOfManufactured: Date("20190219"),
            calorie: 200
        )
    }
}
