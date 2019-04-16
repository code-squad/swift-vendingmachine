//
//  Sprite.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Sprite: Soda {
    
    private var sodaConsistency: Int?
    
    init() {
        self.sodaConsistency = 70
        super.init(
            brand: "코카콜라",
            volume: 355,
            price: 1500,
            name: "스프라이트",
            manufacturedDate: Date.changeString(beforeString: "20180513"), 
            suger: true)
    }
    
    convenience init(sodaConsistency: Int) {
        self.init()
        self.sodaConsistency = sodaConsistency
    }
    
    func same(_ number: Int) -> Bool {
        return self.sodaConsistency == number
    }
    
    
}
