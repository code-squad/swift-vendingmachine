//
//  AdminMode.swift
//  VendingMachine
//
//  Created by oingbong on 01/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct AdminMode {
    let adminible : Adminible

    init(with adminible : Adminible) {
        self.adminible = adminible
    }
    
    public func start() throws {
        var isContinue = true
        while isContinue {
            OutputView.printSelectMenuAdmin()
            let type = try InputView.selectMenuTypeAdmin()
            isContinue = try self.selectMenu(with: type)
        }
    }
    
    public func selectMenu(with type : MenuAdmin) throws -> Bool {
        switch type {
        case .addStock:
            // 재고추가
            try self.addStock()
            return true
        case .deleteStock:
            // 재고삭제
            try self.deleteStock()
            return true
        case .disposeOfExpiredDrinks:
            // 유통기한 지난 음료 폐기
            try self.disposeOfExpiredDrinks()
            return true
        case .exit:
            return false
        }
    }
    
    private func addStock() throws {
        // 출력
        // 추가 가능한 음료 리스트
        OutputView.printAppendableBeverages()
        
        // 입력 선택
        // 1) 추가할 음료 선택 및 수량
        // 2) 종료하기
        
        let (target , amount) = try InputView.selectAddBeverage()
        let beverages = AddingBeverage.select(target: target, amonut: amount)
        let addedBeverages = adminible.addStock(with: beverages)
        OutputView.printAddedBeverages(with: addedBeverages)
    }
    
    private func deleteStock() throws {
        // 출력
        // 제거 가능한 음료 리스트
        let stockList = adminible.stockList()
        try OutputView.printInventoryList(with: stockList)
        
        // 입력 선택
        // 1) 제거할 음료 선택 및 수량
        // 2) 종료하기
        let (target , amount) = try InputView.selectAddBeverage()
        let removedBeverages = adminible.removeStock(target: target, amount: amount)
        OutputView.printRemovedBeverages(with: removedBeverages)
    }
    
    private func disposeOfExpiredDrinks() throws {
        // 출력
        // 유통기한 지난 음료 리스트
        let expiredBeverages = try adminible.expiredBeverages()
        OutputView.printExpiredBeverages(with: expiredBeverages)

        // 입력 선택
        // 1) 음료를 폐기합니다.
        // 2) 아무런 작업하지 않고 종료합니다.
        let isRemoveExpiredBeverages = try InputView.isRemoveExpiredBeverages()
        if isRemoveExpiredBeverages {
            let removedBeverages = try adminible.removeExpiredBeverage(with: expiredBeverages)
            OutputView.printRemoveExpiredBeverages(with: removedBeverages)
        }
    }
}
