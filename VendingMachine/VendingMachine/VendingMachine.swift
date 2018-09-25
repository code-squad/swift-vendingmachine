//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by oingbong on 25/09/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    private let customer = Customer.shared
    private let inventory = Inventory.shared
    private let history = History.shared
    private let value = InputView.correspondingInputValue
    
    public func excute(with type : Menu) throws {
        switch type {
        case .addBalance: self.addBalance()
        case .purchaseBeverage: try self.purchaseBeverage()
        case .historyList: self.historyList()
        }
    }
    
    public func addBalance(){
        if let value = self.value {
            customer.charge(with: value)
        }
    }
    
    public func purchaseBeverage() throws {
        // 1. 판단 : 잔돈 >= 음료금액
        // 2. 처리 : 잔액차감 , 음료재고차감 , 구매내역 저장
        if let value = self.value {
            let isBalanceRemain = try inventory.isAvailablePurchase(target: value, balance: customer.presentBalance())
            guard isBalanceRemain else { throw MachineError.lackBalance }
            let beverage = inventory.remove(target: value)
            customer.remove(with: beverage.beveragePrice())
            history.add(with: beverage)
            OutputView.printPurchase(with: beverage)
        }
    }
    
    public func historyList(){
        let list = history.list()
        OutputView.printHistory(with: list)
    }
}
