//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    var inventory = Inventory.shared
    var customer = Customer.shared
    
    public func run() throws {
        while true {
            // 출력 : 1. 잔액 2. 재고 3. 선택 메뉴
            let balance = customer.presentBalance()
            let list = self.inventory.list()
            OutputView.printPresentBalance(with: balance)
            OutputView.printInventoryList(with: list)
            OutputView.printSelectMenu()
            
            // 입력값 받기
            let menuType = try InputView.selectMenuType()
            
            // 메뉴에 따른 실행
            let vendingMachine = VendingMachine()
            try vendingMachine.excute(with: menuType)
        }
    }
}

do {
    let main = Main()
    try main.run()
} catch let error as Errorable {
    OutputView.printError(with: error)
}
