//
//  Inventory.swift
//  VendingMachine
//
//  Created by 이동영 on 17/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Storable {
    var statistic: [(menu: String, count: Int)] { get }
    
    init(products: [Product])
    
    mutating func addStock(_ product: Product)
    
    func search(at index: Int) -> Product?
    
    func filter(by option: Option) -> [Product]
    
    mutating func takeOut(_ product: Product) -> Product?
    
}

struct Storable: Storable {
    private var stocks: [Product]
    
    var statistic: [(menu: String, count: Int)] {
        return stocks
            .map { $0.productDescription }
            .countDictionary
            .sortedList
    }
    
    init(products: [Product]) {
        self.stocks = products
    }
    
    mutating func addStock(_ product: Product) {
        stocks.append(product)
    }
    
    func search(at index: Int) -> Product? {
        guard index < statistic.count else { return nil }
        let productDescription = statistic[index].menu
        var product = stocks.filter { $0.productDescription == productDescription }
        return product.popLast()
    }
    
    func filter(by option: Option) -> [Product] {
        return stocks.filter { option.condition($0) }
    }
    
    mutating func takeOut(_ product: Product) -> Product? {
        guard
            let index = stocks.firstIndex(where: { product.productName == $0.productName })
            else { return nil }
        return stocks.remove(at: index)
    } 
}

enum Option {
    case all
    case available(balence: Money)
    case hot
    case due
    
    var condition: (Product) -> Bool {
        switch self {
        case .all:
            return { _ in true }
        case .available(let balence):
            return { $0.productPrice < balence }
        case .hot:
            return { $0.isHot }
        case .due:
            return { $0.isDue }
            
        }
        
    }
}
