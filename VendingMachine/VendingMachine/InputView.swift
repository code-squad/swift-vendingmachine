//
//  InputView.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct InputView {
    
    static func read() throws -> [Int] {
        print("1. 금액추가")
        print("2. 음료구매")
        guard let selectedMenu = readLine() else {
            throw ErrorCode.validInputString
        }
        return try separateMenu(selectedMenu)
    }
    private static func separateMenu(_ value: String) throws -> [Int] {
        let menuAndValue = value.split(separator: " ").flatMap{ Int($0) }
        guard !menuAndValue.isEmpty else {
            throw ErrorCode.invalidMenu
        }
        return menuAndValue
    }
    
}
