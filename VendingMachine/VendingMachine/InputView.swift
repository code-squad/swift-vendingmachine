//
//  InputView.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 14..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    static func selectMenu() -> (Int, Int) {
        let input = (readLine() ?? "").split(separator: " ").compactMap { Int($0) }
        return (input.first!, input.last!)
    }
    
    static func readCoin() -> Int {
        return Int(readLine()!) ?? 0
    }
}
