//
//  ShoppingLists.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class ShoppingLists {
    private var lists = [Beverage]()
    
    init() {
        self.lists = []
    }
    
    func buy(_ beverage: Beverage) {
        lists.append(beverage)
    }
    
    func shoppingHistory() -> [Beverage] {
        return self.lists
    }
}
