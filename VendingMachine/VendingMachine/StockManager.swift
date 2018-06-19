//
//  StockManager.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class StockManager: NSObject, StockManagable {

    private var stock: [ObjectIdentifier:Products]
    
    init(stock: [ObjectIdentifier:Products]) {
        self.stock = stock
    }
    
    func add(beverage: Beverage) {
        let productType = ObjectIdentifier(type(of: beverage))
        guard let products = self.stock[productType] else {
            self.stock[productType] = Products(beverages: [beverage])
            return
        }
        products.append(beverage)
    }
    
    func readBuyableProducts(price: Int) -> [Products] {
        return self.stock.values.filter { $0.isCheaper(than: price) }
    }
    
    func buy(_ selected: Products) throws -> Beverage {
        let productsKey = try findKeyOfProducts(selected)
        guard let removed = self.stock[productsKey]?.remove() else {
            throw Error.outOfStock
        }
        return removed
    }
    
    private func findKeyOfProducts(_ selected: Products) throws -> ObjectIdentifier {
        for (productsKey, products) in self.stock {
            if products == selected {
                return productsKey
            }
        }
        throw Error.selectMenuError
    }
    
    func readAllStock() -> [ObjectIdentifier:Products] {
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
    
    func readStock(_ productType: ObjectIdentifier) -> Int {
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
    
    var beverageType: String {
        return self.beverages.last?.description ?? ""
    }
    
    func isCheaper(than price: Int) -> Bool {
        guard let beverage = self.beverages.first else {
            return false
        }
        return !beverage.isExpensive(than: price)
    }
    
    var productPrice: Int {
        return self.beverages.first?.beveragePrice ?? 0
    }
}

extension Products: IteratorProtocol {
    typealias Element = Beverage
    
    func next() -> Element? {
        return beverages.popLast()
    }
}

extension StockManager {
    enum Error: Swift.Error {
        case outOfStock
        case selectMenuError
        
        var errorMessage: String {
            switch self {
            case .outOfStock:
                return "재고가 부족합니다."
            case .selectMenuError:
                return "메뉴에 없는 음료입니다."
            }
        }
    }
}
