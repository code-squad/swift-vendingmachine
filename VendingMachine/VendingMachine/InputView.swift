//
//  InputView.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 31..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    
//    enum menu: Int {
//        case addMoney : 1
//        case addBeverage: 2
//        
//    }
    
    func inputCoin() -> Int {
        let coin = Int(readLine() ?? "") ?? 0
        return coin
    }
    
}
