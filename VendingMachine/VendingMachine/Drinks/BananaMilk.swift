//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    private var bananaJuiceAmount: Double
    
    init(name: String, volume: Int, brand: String, date: String, fat: Bool, bananaAmount: Double) {
        self.bananaJuiceAmount = bananaAmount
        super.init(name: name, volume: volume, price: 1500, brand: brand, date: date, fat: fat)
    }
    
    convenience init() {
        self.init(name: "서울우유", volume: 200, brand: "빙그레바나나우유", date: "20190220", fat: true, bananaAmount: 1.1)
    }
    
    func isHighJuiceAmount() -> Bool {
        return bananaJuiceAmount > 1.0
    }
    
    override func convertToStringBeverage() -> String {
        return "\(type(of: self))"
    }
}
