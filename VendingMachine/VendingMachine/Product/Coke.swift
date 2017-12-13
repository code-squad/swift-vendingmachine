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
    private var sugarContent: Int // g, 8fl
    private var businessUse: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: String, sugarContent: Int, labelColor: String, forWhere used: Bool) {
        self.sugarContent = sugarContent
        self.bottelLabelColor = labelColor
        self.businessUse = used
        super.init(kind: "콜라", brand: brand, volume: volume, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    
    func isLowCoke() -> Bool {
        return 27 >= sugarContent
    }
    
    func isBusinessUse() -> Bool {
        return businessUse
    }
    
    func isLabelColor() -> String {
        return bottelLabelColor
    }
    
}
