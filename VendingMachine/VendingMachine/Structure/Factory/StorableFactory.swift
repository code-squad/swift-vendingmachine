//
//  StorableFactory.swift
//  VendingMachine
//
//  Created by 이동영 on 29/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct StorableFactory {
    
    static func create(categories: [Category] = Category.allCases, quantity: Int) -> Storable {
        let beverages = categories
            .map { [Product](repeating: $0.instance, count: quantity) }
            .reduce([Product]()) { $0 + $1.map { $0 }}
        return Inventory(products: beverages)
    }
}

enum Category: CaseIterable {
    case strawberryMilk
    case chocolateMilk
    case cola
    case energyDrink
    case americano
    case cafeLatte
    
    var instance: Beverage {
        switch self {
        case .strawberryMilk:
            return StrawberryMilk()
        case .chocolateMilk:
            return ChocolateMilk()
        case .cola:
            return Cola()
        case .energyDrink:
            return EnergyDrink()
        case .americano:
            return Americano()
        case .cafeLatte:
            return CafeLatte()
        }
    }
    
}
