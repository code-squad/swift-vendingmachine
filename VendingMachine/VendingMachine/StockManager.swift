//
//  StockManager.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class StockManager {
    // 재고 리스트 반환.
    private var inventoryHistory: [String:Stock]
    init() {
        self.inventoryHistory = [:]
    }

    func record(for beverage: VendingMachine.Menu) {
        self.inventoryHistory.update(forKey: beverage.description)
    }

    func isSoldOut(_ beverageType: String) -> Bool {
        guard let stock = self.inventoryHistory[beverageType] else { return true }
        return stock < 1
    }

    // 품절이 아닌 상품 리스트 반환.
    func showSellingList() -> [VendingMachine.Menu] {
        return inventoryHistory.filter { return !isSoldOut($0.key) }.flatMap {
            return VendingMachine.Menu(rawValue: $0.key)
        }
    }

}
