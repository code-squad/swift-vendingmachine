//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by jang gukjin on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private var strawberryContent: Double
    
    init(stringDate: String, strawberryContent: Double){
        self.strawberryContent = strawberryContent
        super.init(capacity: 200, price: 2600, name: "딸기우유", stringDate: stringDate, milkFarmCode: 70306)
    }
}
