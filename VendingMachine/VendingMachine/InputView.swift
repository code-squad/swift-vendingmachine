//
//  InputView.swift
//  VendingMachine
//
//  Created by 이동건 on 18/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum MenuType: String {
    static let description = "\n1. 금액추가\n2. 음료구매\n> "
    
    case deposit = "1"
    case purchase = "2"
}

class InputView {
    
    static func read(with menu: [(Beverage,Int)], account: Int) -> String? {
        let intro = Comment.introdution(account: account)
        let list = Comment.list(menu, isSelectable: account != 0)
        OutputView.display(with: intro)
        OutputView.display(with: list)
        print(MenuType.description, terminator: "")
        return readLine()
    }
}
