//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    public func run() throws {
        while true {
            let inventory = Inventory.shared
            let customer = Customer.shared
            
            // 출력 : 1. 잔액 2. 재고 3. 선택 메뉴
            let balance = customer.presentBalance()
            let list = inventory.list()
            OutputView.printPresentBalance(with: balance)
            try OutputView.printInventoryList(with: list)
            OutputView.printSelectMenu()
            
            // 입력값 받기
            let (menuType, value) = try InputView.selectMenuType()
            
            // 메뉴에 따른 실행
            let vendingMachine = VendingMachine()
            try vendingMachine.excute(with: menuType, value: value)
        }
    }
}

do {
    // 재고 추가
    let stock = Stock.prepareStock()
    let inventory = Inventory.shared
    inventory.stockUp(with: stock)
    
    // 시작
    let main = Main()
    try main.run()
} catch let error as Errorable {
    OutputView.printError(with: error)
}
