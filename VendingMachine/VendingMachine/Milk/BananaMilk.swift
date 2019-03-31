//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    
    private let milkFarmCode: MilkFarmCode?
    
    init() {
        self.milkFarmCode = .Jejudo
        super.init(brand: "상하목장", volume: 250, price: 1500, name: "바나나우유", manufacturedDate: Date.changeString(beforeDate: "20190320"), hot: true)
    }
    
    func isMilkFarmCode() -> MilkFarmCode? {
        guard let milkFarmCode = milkFarmCode else {
            return nil
        }
        return milkFarmCode
    }
    
}
