//
//  Coffee.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/21.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let coffeeType: CoffeeType
    private let temperature: Int
    private let hotTemperatureCriterion = 65
    
    init(brand: String, capacity: Int, price: Int, name: String, expirationDate: Date, coffeeType: CoffeeType = .americano, temperature: Int) {
        self.coffeeType = coffeeType
        self.temperature = temperature
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, expirationDate: expirationDate)
    }
    
    var isHot: Bool {
        return hotTemperatureCriterion < temperature
    }
}

extension Coffee {
    enum CoffeeType: CustomStringConvertible {
        case espresso
        case americano
        case cafeLatte
        case coldBrew
        
        var description: String {
            switch self {
            case .espresso:
                return "에스프레소"
            case .americano:
                return "아메리카노"
            case .cafeLatte:
                return "카페라테"
            case .coldBrew:
                return "콜드브루"
            }
        }
    }
}
