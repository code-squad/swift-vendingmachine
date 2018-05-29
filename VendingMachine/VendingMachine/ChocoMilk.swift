//
//  ChocoMilk.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class ChocoMilk: Milk {
    
    override var kind: String {
        return "ChocoMilk"
    }
    private let farmCode = "farmOrganic"
    
    override init(_ brand: String, _ volume: Int, _ price: Int, _ name: String, _ date: Date) {
        super.init(brand, volume, price, name, date)
    }
    
    override func checkFarmCode() -> String {
        return self.farmCode
    }
    
}
