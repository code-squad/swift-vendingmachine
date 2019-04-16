//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    
    private let milkFarmCode: MilkFarmCode?
    
    init() {
        self.milkFarmCode = .Seoul
        super.init(brand: "서울우유", volume: 250, price: 1500, name: "초코우유", manufacturedDate: Date.changeString(beforeString: "20190320"), hot: false, expiryPeriod: 3)
    }
    
    func same(_ milkCode: MilkFarmCode) -> Bool {
        return self.milkFarmCode == milkCode
    }
    
}
