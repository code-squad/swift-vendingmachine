//
//  StarbucksCoffee.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StarbucksCoffee: Coffee {
    
    private let beanKind: CoffeeBean?
    
    init() {
        self.beanKind = .java
        super.init(brand: "동서식품", volume: 281, price: 3000, name: "스타벅스 모카", manufacturedDate:Date.changeString(beforeString: "20180915"), caffeine: 30)
    }
    
    func same(_ bean: CoffeeBean) -> Bool {
        return self.beanKind == bean
    }
}
