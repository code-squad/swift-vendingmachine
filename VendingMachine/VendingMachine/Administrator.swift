//
//  Administrator.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 21..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation


class Administrator {
    
    let vendingMachine: VendingMachineManagable
    
    static let allBeverageType = [TOP.self, Cantata.self, Georgia.self, StrawberryMilk.self, ChocoMilk.self, Coke.self, Sprite.self]
    
    init(_ vendingMachine: VendingMachineManagable) {
        self.vendingMachine = vendingMachine
    }
    
    static func makeBeverage(_ menuNumber: Int) -> Beverage? {
        return self.allBeverageType[menuNumber-1].init()
    }
    
    func removeBeverage(_ menuNumber: Int) {
        let allstock = self.vendingMachine.readAllStock()
        allstock[menuNumber-1].remove()
    }
    
    func removeExpiration() {
        self.vendingMachine.removeExpired()
    }
}

extension Administrator {
    enum Error: Swift.Error {
        case selectMenuError
        
        var errorMessage: String {
            switch self {
            case .selectMenuError:
                return "메뉴에 없는 음료입니다."
            }
        }
    }
}
