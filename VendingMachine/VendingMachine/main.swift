//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    var inventory = Inventory()
    var customer = Customer()
    
    func run() {
        // 메뉴 출력
        // 1. 잔액 2. 재고 3. 선택목록 리스트
        let balance = customer.presentBalance()
        OutputView.printPresentBalance(with: balance)
        let list = self.inventory.list()
        OutputView.printInventoryList(with: list)
    }
}

let vendingMachine = VendingMachine()
vendingMachine.run()
