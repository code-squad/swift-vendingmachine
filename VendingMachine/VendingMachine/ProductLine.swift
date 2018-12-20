//
//  ProductLine.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 19..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct ProductLine {
    private var products: [Beverage] = []
    
    mutating func add(product:Beverage) {
        self.products.append(product)
    }
    
    func buyableProduct(money: Int) -> String? {
        let product = self.products[0]
        return product.buyableProduct(money:money)
    }
    
    mutating func bringOutProduct() -> Beverage? {
        return self.products.popLast()
    }
    
    func productName() -> String {
        return self.products[0].readName()
    }
    
    func productCount() -> Int {
        return self.products.count
    }
    
    func expiredProducts() -> [Beverage] {
        return self.products.filter() {$0.isExpiryDateOut() == true}
    }
    
    func hotProducts() -> [Beverage]? {
        guard let product = products[0] as? VariousTemperatures else {return nil}
        guard product.isHot else {return nil}
        return self.products
    }
}
