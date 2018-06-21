//
//  InputView.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 31..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    enum Menu: Int {
        case inputCoin = 1
        case purchasesBeverage = 2
        case showPurchases = 3
        case exit = 4
        case invalidMenu
    }
    
    func inputMenu() -> Menu {
        let inputNumber = Int(readLine() ?? "") ?? 0
        guard let number = Menu(rawValue: inputNumber) else { return Menu.invalidMenu}
        return number
    }
    
    func inputCoin() -> Int {
        let coin = Int(readLine() ?? "") ?? 0
        return coin
    }
    
    func inputNumberOfBeverage() -> Int {
        let number = Int(readLine() ?? "") ?? 0
        return number
    }
    

    
}
