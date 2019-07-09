//
//  ProductSoldable.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol ProductSoldable {
    func displayDrinkStockInfo()
    func sellProduct(productId: Int) -> Drink?
}
