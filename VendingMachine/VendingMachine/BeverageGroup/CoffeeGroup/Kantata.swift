//
//  Kantata.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Kantata: Coffee {
    private var kindOfBeans: String = "GuatemalaAntiqua"
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, kindOfBeans: String) {
        self.kindOfBeans = kindOfBeans
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
        super.typeOfBeverage = String(describing: type(of: self))
        super.kindOf = "칸타타"
    }
    override var description: String {
        return "\(self.kindOf)(\(typeOfBeverage))\(super.description)"
    }
    
    func isGuatemalaBeans() -> Bool {
        return (self.kindOfBeans == "GuatemalaAntiqua")
    }
}
