//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    var inventory = Inventory.shared
    var customer = Customer.shared
    
    func run() throws {
        while true {
            // 출력 : 1. 잔액 2. 재고 3. 선택 메뉴
            let balance = customer.presentBalance()
            let list = self.inventory.list()
            OutputView.printPresentBalance(with: balance)
            OutputView.printInventoryList(with: list)
            OutputView.printSelectMenu()
            
            // 입력값 받기
            let (type, value) = try InputView.selectMenuType()
            
            // 메뉴 선택
            try Menu.select(type: type, with: value)
        }
    }
}

do {
    let vendingMachine = VendingMachine()
    try vendingMachine.run()
} catch let error as Errorable {
    OutputView.printError(with: error)
}
