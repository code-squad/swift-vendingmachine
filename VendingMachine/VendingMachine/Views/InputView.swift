//
//  InputView.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func readMenu() -> Int {
        for menu in Menu.allCases {
            print(menu)
        }
        
        return readInput()
    }
    
    static func readInput() -> Int {
        let input = readLine() ?? ""
        
        return Int(input) ?? -1
    }
}
