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
    
    public func excute(with type : Menu , value : Int) throws {
        switch type {
        case .addBalance: self.addBalance(value: value)
        case .purchaseBeverage: try self.purchaseBeverage(value: value)
        case .historyList: self.historyList()
        }
    }
    
    private func addBalance(value : Int){
        customer.charge(with: value)
    }
    
    private func purchaseBeverage(value : Int) throws {
        // 1. 판단 : 잔돈 >= 음료금액
        // 2. 처리 : 잔액차감 , 음료재고차감 , 구매내역 저장
        let isBalanceRemain = try inventory.isAvailablePurchase(target: value, balance: customer.presentBalance())
        guard isBalanceRemain else { throw MachineError.lackBalance }
        guard let beverage = inventory.remove(target: value) else { throw MachineError.outOfStock }
        customer.remove(with: beverage.beveragePrice())
        history.add(with: beverage)
        OutputView.printPurchase(with: beverage)
    }
    
    private func historyList(){
        let list = history.list()
        OutputView.printHistory(with: list)
    }
}
