//
//  Coffee.swift
//  VendingMachine
//
//  Created by 이동영 on 13/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    // MARK: Nested enum CoffeeBean
    enum CoffeeBean {
        case arabica
        case robusta
        case luwak
    }
    // MARK: - Properties
    private let coffeeBean: CoffeeBean
    
    // MARK: - Methods
    init(brand: String = "제조사",
         capacity: Int = 0,
         price: Int = 0,
         name: String = "커피",
         productDate: Date = Date(),
         storeDuration: Int = 10,
         temperature: Int = standardTemperature,
         coffeeBean: CoffeeBean = .arabica) {
        self.coffeeBean = coffeeBean
        
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   productDate: productDate,
                   storeDuration: storeDuration,
                   temperature: temperature)
    }
    
    required convenience init () {
        self.init(price: 0,
                  name: "커피")
    }
}
