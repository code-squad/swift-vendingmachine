//
//  InputView.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 31..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    func inputCoin() -> Int {
        let coin = Int(readLine() ?? "") ?? 0
        return coin
    }
    
}
