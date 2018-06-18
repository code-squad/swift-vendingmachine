//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol StockManagable {
    func add(beverage: Beverage)
    func readBuyableProducts(price: Int) -> [ProductType:Int]
    func buy(_ productType: ProductType) -> Beverage?
    func readAllStock() -> [ProductType:Products]
    func readStock(_ productType: ProductType) -> Int
    func remove(_ conditionHandler: (Beverage) -> Bool ) -> [Beverage]
}

class VendingMachine: NSObject, AvailableVendingMachine {
    
    private var balance: Int = 0
    private var stockManager: StockManagable
    private var history = [Beverage]()
    private let hotTemperature: Double = 90.0
    
    init(stockManager: StockManagable) {
        self.stockManager = stockManager
    }
    
    func insertMoney(_ price: Int) {
        self.balance += price
    }
    
    func readBalance() -> String {
        return "\(self.balance)원"
    }
    
    func add(beverage: Beverage) {
        self.stockManager.add(beverage: beverage)
    }
    
    func readBuyableProducts() -> [ProductType:Int] {
        return self.stockManager.readBuyableProducts(price: self.balance)
    }
    
    func buy(_ productType: ProductType) throws -> Beverage {
        if productType.price > self.balance { throw Error.insufficientBalance }
        guard let removed = self.stockManager.buy(productType) else {
            throw Error.soldOut
        }
        self.balance -= productType.price
        self.history.append(removed)
        return removed
    }
    
    func readAllStock() -> [ProductType:Products] {
        return self.stockManager.readAllStock()
    }
    
    func removeExpired() -> [Beverage] {
        return self.stockManager.remove{ $0.isExpired(Date()) }
    }
    
    func removeHot() -> [Beverage] {
        return self.stockManager.remove{
            guard let coffee = $0 as? Coffee else {
                return false
            }
            return coffee.isHot(than: 90.0)
        }
    }
    
    func readPurchaseHistory() -> [Beverage] {
        return self.history
    }
    
    func readStock(_ productType: ProductType) -> Int {
        return self.stockManager.readStock(productType)
    }
}

extension VendingMachine {
    enum Error: Swift.Error {
        case insufficientBalance
        case soldOut
        case selectMenuError
        
        var errorMessage: String {
            switch self {
            case .insufficientBalance:
                return "잔액이 부족합니다."
            case .soldOut:
                return "재고가 부족합니다."
            case .selectMenuError:
                return "없는 메뉴를 선택했습니다. 다시 선택하세요"
            }
        }
    }
}
