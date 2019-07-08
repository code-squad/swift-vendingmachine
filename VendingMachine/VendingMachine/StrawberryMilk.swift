//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by jang gukjin on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    static let strawberryContent: Double = 8.0
    
    init(stringData: String){
        super.init(capacity: 200, price: 2600, name: "날마다딸기우유", stringDate: stringData, milkFarmCode: 70306)
    }
}
