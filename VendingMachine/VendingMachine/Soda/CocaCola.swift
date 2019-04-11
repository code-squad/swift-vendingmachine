//
//  CocaCola.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CocaCola: Soda {
    
    private var sodaConsistency: Int?
    
    init() {
        self.sodaConsistency = 50
        super.init(
            brand: "코카콜라",
            volume: 355,
            price: 1500,
            name: "코카콜라",
            manufacturedDate: Date.changeString(beforeString: "20190213"),
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
