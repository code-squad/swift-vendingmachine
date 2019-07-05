//
//  Cantata.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation


class Cantata: Coffee{
    private let model : String
    
    init(brand: String, quantity: Int, price: Int, name: String, date: Date, coffeine: Double = 100.0, origin: CoffeeBean = CoffeeBean.arabica, model: String = "1Bean") {
        self.model = model
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, coffeine: coffeine, origin: origin)
    }
}
