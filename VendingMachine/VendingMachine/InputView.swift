//
//  InputView.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 13..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func readMenu() -> (menuOption: Menu, detail: Int)? {
        let menu: String = """
    1. 금액추가
    2. 음료구입
    3. 잔돈출금
    """
        print(menu)
        var realMenu = [Int]()
        if let menu = readLine() {
            guard menu != "q" else { return nil }
            if menu == "3" {
                return (menuOption: .withdrawlBalance, -1)
            }
            let tempMenu = menu.split(separator: " ").flatMap{ Int($0) }
            realMenu = tempMenu
        }
        if realMenu.count != 2 { return nil }
        
        guard let menuOption = Menu(rawValue: realMenu[0]) else { return nil }
        return (menuOption, realMenu[1])
    }
}

extension InputView {
    enum Menu: Int {
        case putCoin = 1, buyBeverage, withdrawlBalance
    }
}
