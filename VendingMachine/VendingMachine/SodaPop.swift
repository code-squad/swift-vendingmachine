//
//  SodaPop.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class SodaPop: Beverage {
    private let kind: String
    init(kind:String, brand: String, volume: Int, price: Int, name: String, manufacturingDate: String) {
        self.kind = kind
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    
    override var description: String {
        return "\(kind) - " + super.description
    }
}
