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
    private var stock: [VendingMachine.Menu.RawValue:Stock]
    private var purchasedHistory: [HistoryInfo]
    init(_ vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
        self.stock = [:]
        self.purchasedHistory = []
    }

    // 인벤토리 상태에 따라 장부 업데이트.
    func updateStock(_ oldStock: Set<Beverage>) {
        // 음료수가 더해졌는지, 빠졌는지 확인하기 위함.
        var isAdded = false
        if oldStock.isSubset(of: self.vendingMachine) {
            isAdded = true
        }
        // 인벤토리 상태의 차이를 장부에 기록.
        record(for: oldStock.symmetricDifference(self.vendingMachine), isAdded)
    }

    // 변경된 부분을 장부에 기록.
    private func record(for changes: Set<Beverage>, _ isAdded: Bool) {
        for change in changes {
            self.stock.update(forKey: change.description, isAdded)
        }
    }

    // 품절 여부 반환.
    func isSoldOut(_ beverageType: String) -> Bool {
        guard let stock = self.stock[beverageType] else { return true }
        return stock < 1
    }

    func showStockList() -> [VendingMachine.Menu.RawValue:Stock] {
        return self.stock
    }

    // 품절이 아닌 메뉴 리스트 반환.
    func showSellingList() -> [VendingMachine.Menu] {
        let notSoldOutList = self.stock.filter { !isSoldOut($0.key) }
        return notSoldOutList.flatMap { VendingMachine.Menu.init($0.key) }
    }

    // 유통기한이 지난 재고 리스트 반환.
    func showExpiredList() -> [VendingMachine.Menu.RawValue:Stock] {
        var expiredList: [VendingMachine.Menu.RawValue:Stock] = [:]
        let checkingDay = Date(timeIntervalSinceNow: 0)
        // 현재 자판기 내 음료수 중
        for beverage in self.vendingMachine {
            // 유통기한이 현재 날짜 기준으로 지난 경우,
            guard beverage.isExpired(with: checkingDay) else { break }
            // 리스트에 해당 음료수의 이름과 개수 기록.
            expiredList.update(forKey: beverage.description, true)
        }
        return expiredList
    }

    func showPurchasedHistory() -> [HistoryInfo] {
        return self.purchasedHistory
    }

    func recordHistory(_ oldStock: Set<Beverage>) {
        // 음료수를 빼먹은 경우.
        if isPurchased(oldStock) {
            recordHistoryOfEach(oldStock)
        }
    }

    private func isPurchased(_ oldStock: Set<Beverage>) -> Bool {
        // 이전 상태가 현재 상태를 포함하는 관계이면 음료수를 빼먹은 상황으로 판단. - self.vendingMachine을 Set 타입으로 직접 쓸 수 없어서 이렇게 사용함.
        return oldStock.isSuperset(of: self.vendingMachine)
    }

    private func recordHistoryOfEach(_ oldStock: Set<Beverage>) {
        // 빼먹은 음료수들을 돌면서
        for beverage in oldStock.symmetricDifference(vendingMachine) {
            // 빼먹은 음료수의 히스토리를 생성.
            let purchasedInfo = HistoryInfo(purchasingDate: Date(timeIntervalSinceNow: 0), purchasedMenu: beverage.description, count: 1)
            // 기록.
            self.purchasedHistory.append(purchasedInfo)
        }
    }

}
