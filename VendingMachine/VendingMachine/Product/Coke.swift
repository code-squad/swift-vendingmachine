//
//  Coke.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class Coke: SodaPop {
    private let bottelLabelColor: String
    private var businessUse: Bool
    
    init(sugarContent: Double, volume: Int, price: Int, name: String, manufacturingDate: String, labelColor: String, forBusiness used: Bool) {
        self.bottelLabelColor = labelColor
        self.businessUse = used
        super.init(kind: "콜라", sugarContent: sugarContent, brand: "코카콜라", volume: volume, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    override var description: String {
        return "\(super.kind)(\(String(describing: type(of: self)))) - " + super.description
    }

    func isBusinessUse() -> Bool {
        return businessUse
    }
    
    func isLabelOriginalColor() -> String {
        return bottelLabelColor
    }
    
}
