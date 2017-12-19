//
//  StockManager.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class StockManager {
    private weak var vendingMachine: VendingMachine!
    // 자판기 메뉴별 남은 재고 기록.
    private var stock: [VendingMachine.Menu.RawValue:Stock]
    // 구입이력 기록.
    private var purchasedHistory: [HistoryInfo]
    init(_ vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
        self.stock = [:]
        self.purchasedHistory = []
    }

    // 인벤토리 상태에 따라 장부 업데이트.
    func updateStock(_ oldStock: [Beverage]) {
        // 음료수가 더해졌는지, 빠졌는지 확인하기 위함.
        var difference: Beverage?
        let purchased = isPurchased(oldStock.count, vendingMachine.count)
        if purchased {
            difference = oldStock.last
        }else {
            difference = vendingMachine.last
        }
        record(for: difference, purchased)
    }

    // 구입된 경우 true 반환.
    private func isPurchased(_ oldStockCount: Int, _ currStockCount: Int) -> Bool {
        return oldStockCount > currStockCount
    }

    // 변경된 부분을 장부에 기록.
    private func record(for change: Beverage?, _ isAdded: Bool) {
        guard let change = change else { return }
        stock.update(forKey: change.description, isAdded)
    }

    // 품절 여부 반환.
    func isSoldOut(_ beverageType: String) -> Bool {
        guard let stock = stock[beverageType] else { return true }
        return stock < 1
    }

    // 재고 기록 반환.
    func showStockList() -> [VendingMachine.Menu.RawValue:Stock] {
        return stock
    }

    // 품절이 아닌 메뉴 리스트 반환.
    func showSellingList() -> [VendingMachine.Menu] {
        let notSoldOutList = stock.filter { !isSoldOut($0.key) }
        return notSoldOutList.flatMap { VendingMachine.Menu.init($0.key) }
    }

    // 유통기한이 지난 재고 리스트 반환.
    func showExpiredList(on checkingDay: Date) -> [VendingMachine.Menu.RawValue:Stock] {
        var expiredList: [VendingMachine.Menu.RawValue:Stock] = [:]
        // 현재 자판기 내 음료수 중
        for beverage in vendingMachine {
            // 유통기한이 현재 날짜 기준으로 지난 경우,
            guard beverage.isExpired(with: checkingDay) else { continue }
            // 리스트에 해당 음료수의 이름과 개수 기록.
            expiredList.update(forKey: beverage.description, true)
        }
        return expiredList
    }

    // 구입 이력 반환.
    func showPurchasedHistory() -> [HistoryInfo] {
        return purchasedHistory
    }

    // 구입 이력 기록.
    func recordHistory(_ oldStock: [Beverage]) {
        // 음료수를 빼먹은 경우, 구입 이력 생성 및 기록.
        if isPurchased(oldStock.count, vendingMachine.count) {
            guard let purchased = oldStock.last else { return }
            // 현재 구입된 음료수의 구입이력 생성.
            let purchasedInfo = HistoryInfo(purchasingDate: Date(timeIntervalSinceNow: 0), purchasedMenu: purchased.description, count: 1)
            // 기록.
            purchasedHistory.append(purchasedInfo)
        }
    }

}
