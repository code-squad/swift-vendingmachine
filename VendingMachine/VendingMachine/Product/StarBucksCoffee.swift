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
        super.init("커피", caffeine, temperature, "스타벅스", volume, price, name, manufacturingDate)
    }
    override var description: String {
        return "\(super.kind)(\(String(describing: type(of: self)))) - " + super.description
    }
    
    func isReserve() -> Bool {
        return reserve
    }
}
