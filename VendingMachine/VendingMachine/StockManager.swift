//
//  StockManager.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class StockManager: NSObject {
    
    private var stock: [ProductType:Products]
    
    init(stock: [ProductType:Products]) {
        self.stock = stock
    }
    
    func add(beverage: Beverage) {
        guard let productType = beverage.productType else {
            return
        }
        if let products = self.stock[productType] {
            products.append(beverage)
        } else {
            self.stock[productType] = Products(beverages: [beverage])
        }
    }
    
    // 구매가능한 [음료종류:재고]로 반환
    func readBuyableProducts(price: Int) -> [ProductType:Int] {
        return self.stock.filter { $0.key.price <= price }.mapValues{ $0.count }
    }
    
    func buy(_ productType: ProductType) -> Beverage? {
        return self.stock[productType]?.remove()
    }
    
    func readAllStock() -> [ProductType:Products] {
        return self.stock
    }
    
    func removeExpired() -> [Beverage] {
        var expired = [Beverage]()
        for (productType, products) in self.stock {
            expired += products.removeExpired()
            if products.count == 0 {
                self.stock.removeValue(forKey: productType)
            }
        }
        return expired
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let stockManager = object as? StockManager else {
            return false
        }
        return self.stock == stockManager.stock
    }
}

class Products: NSObject, Sequence {
    
    private var beverages: [Beverage]
    
    var count: Int {
        return self.beverages.count
    }
    
    init(beverages: [Beverage]) {
        self.beverages = beverages
    }
    
    func append(_ beverage: Beverage) {
        self.beverages.append(beverage)
    }
    
    func remove() -> Beverage? {
        return self.beverages.popLast()
    }
    
    func removeExpired() -> [Beverage] {
        let expired = self.beverages.filter { $0.isExpired(Date()) }
        self.beverages = self.beverages.filter { !$0.isExpired(Date()) }
        return expired
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let product = object as? Products else {
            return false
        }
        return self.beverages == product.beverages
    }
}

extension Products: IteratorProtocol {
    typealias Element = Beverage
    
    func next() -> Element? {
        return beverages.popLast()
    }
}
