//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

// VendingMachine에서 사용할 수 있는 StockManager의 메서드
protocol StockManagable {
    func add(beverage: Beverage)
    func readBuyableProducts(price: Int) -> [Products]
    func buy(_ selected: Products) throws -> Beverage
    func readAllStock() -> [Products]
    func remove(_ conditionHandler: (Beverage) -> Bool ) -> [Beverage]
    func readStock(_ productType: ObjectIdentifier) -> Int
}

// user와 admin의 공통 사용 메서드
protocol ProductsCheckable {
    func readBuyableProducts() -> [Products]
    func readAllStock() -> [Products]
    func readBalance() -> Int
}

// User가 VendingMachine에서 사용할 메서드
protocol UserAvailable: ProductsCheckable {
    func insertMoney(_ price: Int)
    func buy(_ products: Products) throws -> Beverage
}

// Admin이 VendingMachine에서 사용할 메서드
protocol VendingMachineManagable: ProductsCheckable {
    func add(beverage: Beverage)
    func removeExpired() -> [Beverage]
    func readPurchaseHistory() -> [Beverage]
    func readStock(_ productType: ObjectIdentifier) -> Int
}

class VendingMachine: NSObject, VendingMachinePrintable {
    
    private var money: Money = Money()
    private let stockManager: StockManagable
    private var history: History
    private let hotTemperature: Double = 90.0
    
    private static let sharedVendingMachine = VendingMachine(stockManager: StockManager(stock: [:]), history: History(purchased: []))
    
    private init(stockManager: StockManagable, history: History) {
        self.stockManager = stockManager
        self.history = history
    }
    
    class func shared() -> VendingMachine {
        return self.sharedVendingMachine
    }
    
    
    func readBalance() -> Int {
        return self.money.readBalance()
    }
    
    func removeHot() -> [Beverage] {
        return self.stockManager.remove{
            guard let coffee = $0 as? Coffee else {
                return false
            }
            return coffee.isHot(than: 90.0)
        }
    }
    
    // VendingMachine Error
    enum Error: Swift.Error {
        case insufficientBalance
        
        var errorMessage: String {
            switch self {
            case .insufficientBalance:
                return "잔액이 부족합니다."
            }
        }
    }
}

extension VendingMachine: ProductsCheckable {
    
    func readBuyableProducts() -> [Products] {
        return self.stockManager.readBuyableProducts(price: self.money.readBalance())
    }
    
    func readAllStock() -> [Products] {
        return self.stockManager.readAllStock()
    }
}

extension VendingMachine: UserAvailable {

    func insertMoney(_ price: Int) {
        self.money.increaseBalance(price)
    }
    
    func buy(_ products: Products) throws -> Beverage {
        let selected = try self.stockManager.buy(products)
        self.money.decreaseBalance(selected.beveragePrice)
        self.history.addPurchased(selected)
        return selected
    }
}

extension VendingMachine: VendingMachineManagable {
    
    func add(beverage: Beverage) {
        self.stockManager.add(beverage: beverage)
    }
    
    func removeExpired() -> [Beverage] {
        return self.stockManager.remove{ $0.isExpired(Date()) }
    }
    
    func readPurchaseHistory() -> [Beverage] {
        return self.history.readPurchased()
    }
    
    func readStock(_ productType: ObjectIdentifier) -> Int {
        return self.stockManager.readStock(productType)
    }
}
