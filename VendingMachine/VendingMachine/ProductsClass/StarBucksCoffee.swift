//
//  StarBucksCoffee.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class StarBucksCoffee: Coffee {
    private let reserve: Bool
    init(reserve: Bool, caffeine: Bool, temperature: Double, volume: Int, price: Int, name: String, manufacturingDate: String) {
        self.reserve = reserve
        super.init(kind: "커피", caffeine: caffeine, temperature: 98, brand: "스타벅스", volume: 700, price: 2000, name: name, manufacturingDate: manufacturingDate)
    }
    override var description: String {
        return "\(String(describing: type(of: self)))"
    }
    
    func isReserve() -> Bool {
        return reserve
    }
}
