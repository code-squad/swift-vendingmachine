//
//  StockManager.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class StockManager: NSObject, StockManagable {
    
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
        guard let products = self.stock[productType] else { return nil }
        if products.count == 0 {
            self.stock.removeValue(forKey: productType)
            return nil
        } else {
            return products.remove()
        }
    }
    
    func readAllStock() -> [ProductType:Products] {
        return self.stock
    }
    

    func remove(_ conditionHandler: (Beverage) -> Bool ) -> [Beverage] {
        var removed = [Beverage]()
        for (productType, products) in self.stock {
            removed += products.remove(conditionHandler)
            if products.count == 0 {
                self.stock.removeValue(forKey: productType)
            }
        }
        return removed
    }
    
    func readStock(_ productType: ProductType) -> Int {
        return self.stock[productType]?.count ?? 0
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
    
    func remove(_ handler: (Beverage) -> Bool ) -> [Beverage] {
        let removed = self.beverages.filter{ handler($0) }
        self.beverages = self.beverages.filter { !handler($0) }
        return removed
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
