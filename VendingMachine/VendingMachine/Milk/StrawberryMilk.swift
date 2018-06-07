//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    
    private let containRealStrawberry: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, containRealStrawberry: Bool) {
        self.containRealStrawberry = containRealStrawberry
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate)
    }
}
