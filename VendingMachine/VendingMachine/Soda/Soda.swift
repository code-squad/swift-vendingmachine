//
//  Soda.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    
    private let suger: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date,endDate: EndDate = EndDate.Soda ,suger: Bool ) {
        self.suger = suger
        super.init(
            brand: brand,
            volume: volume,
            price: price,
            name: name,
            manufacturedDate: manufacturedDate,
            endDate: EndDate.Soda)
    }
    
    // 무가당 여부
    func isSuger() -> Bool {
        if suger == true { return true }
        return false
    }
    
}
