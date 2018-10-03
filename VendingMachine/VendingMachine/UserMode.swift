//
//  UserMode.swift
//  VendingMachine
//
//  Created by oingbong on 01/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct UserMode {
    let userable: Userable

    init(with userable: Userable) {
        self.userable = userable
    }

    public func start() throws {
        var isContinue = true
        while isContinue {
            // 출력 : 1. 잔액 2. 재고 3. 선택 메뉴
            let balance =  userable.presentBalance()
            let stockList = userable.stockList()
            OutputView.printPresentBalance(with: balance)
            try OutputView.printInventoryList(with: stockList)
            OutputView.printSelectMenu()

            // 입력값 받기
            let (menuType, value) = try InputView.selectMenuType()

            // 메뉴에 따른 실행
            isContinue = try self.selectMenu(with: menuType, value: value)
        }
    }

    public func selectMenu(with type: Menu, value: Int) throws -> Bool {
        switch type {
        case .addBalance:
            self.addBalance(value: value)
            return true
        case .purchaseBeverage:
            try self.purchaseBeverage(value: value)
            return true
        case .historyList:
            self.historyList()
            return true
        case .exit:
            return false
        }
    }

    private func addBalance(value: Int) {
        userable.addBalance(value: value)
    }

    private func purchaseBeverage(value: Int) throws {
        // 1. 판단 : 잔돈 >= 음료금액
        // 2. 처리 : 잔액차감 , 음료재고차감 , 구매내역 저장
        let isBalanceRemain = try userable.isAvailablePurchase(target: value, balance: userable.presentBalance())
        guard isBalanceRemain else { throw MachineError.lackBalance }
        guard let beverage = userable.remove(target: value) else { throw MachineError.outOfStock }
        OutputView.printPurchase(with: beverage)
    }

    private func historyList() {
        let list = userable.historyList()
        OutputView.printHistory(with: list)
    }
}
