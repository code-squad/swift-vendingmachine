//
//  Cider.swift
//  VendingMachine
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation
enum FantaFlavor {
    case grape
    case orange
}

class Fanta: CarbonatedDrink {
    private var fantaFlavor: FantaFlavor
    
    init(name: String, volume: Int, brand: String, date: String, isZeroCalorie: Bool, fantaFlavor: FantaFlavor) {
        self.fantaFlavor = fantaFlavor
        super.init(name: name, volume: volume, price: 2000, brand: brand, date: date, isZeroCalorie: isZeroCalorie)
    }
    
    convenience init() {
        self.init(name: "환타", volume: 350, brand: "다이어트환타", date: "20191009", isZeroCalorie: false, fantaFlavor: .orange)
    }
    
    func isIncludeGrape() -> Bool {
        return fantaFlavor == .grape
    }
    
    func isIncludeOrange() -> Bool {
        return fantaFlavor == .orange
    }
    
    override func convertToStringBeverage() -> String {
        return "\(type(of: self))"
    }
}
