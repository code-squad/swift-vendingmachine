//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    let vendingMachine = VendingMachine(with: Stock.prepareStock())
    let customer = Customer()
    let history = History()
    
    public func run() throws {
        while true {
            // 출력 : 1. 잔액 2. 재고 3. 선택 메뉴
            let balance = customer.presentBalance()
            let list = vendingMachine.list()
            OutputView.printPresentBalance(with: balance)
            try OutputView.printInventoryList(with: list)
            OutputView.printSelectMenu()
            
            // 입력값 받기
            let (menuType, value) = try InputView.selectMenuType()
            
            // 메뉴에 따른 실행
            try self.selectMenu(with: menuType, value: value)
        }
    }
    
    public func selectMenu(with type : Menu , value : Int) throws {
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
        let isBalanceRemain = try vendingMachine.isAvailablePurchase(target: value, balance: customer.presentBalance())
        guard isBalanceRemain else { throw MachineError.lackBalance }
        guard let beverage = vendingMachine.remove(target: value) else { throw MachineError.outOfStock }
        customer.remove(with: beverage.beveragePrice())
        history.add(with: beverage)
        OutputView.printPurchase(with: beverage)
    }
    
    private func historyList(){
        let list = history.list()
        OutputView.printHistory(with: list)
    }
}

do {
    // 시작
    let main = Main()
    try main.run()
} catch let error as Errorable {
    OutputView.printError(with: error)
}
