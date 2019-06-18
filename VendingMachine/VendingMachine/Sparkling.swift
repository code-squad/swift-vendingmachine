//
//  Sparkling.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Sparkling: Drink {
    let lawCalorie: Bool
    
    init(brand: String, ml: Int, price: Int, name: String, productDate: String, lawCalorie: Bool) {
        self.lawCalorie = lawCalorie
        super.init(brand: brand, ml: ml, price: price, name: name, productDate: productDate)
    }
    
    func isLowCalorie() -> Bool {
        return lawCalorie
    }
}
