//
//  OutputView.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 11..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct OutputView {

    func show(balance: Int) {
        print("현재 투입한 금액이 \(balance)원 입니다.")
    }

    func show(products: Products) {
        print(products)
    }

    func show(inventory: Inventory, buyableProducts: Array<Category>) {
        print("다음과 같은 음료가 있습니다.")
        for i in 0..<buyableProducts.count {
            print("\(i+1)) \(buyableProducts[i]) \(inventory[buyableProducts[i]]![0].description.split(separator: ",").filter { $0.hasSuffix("원") }[0].trimmingCharacters(in: .whitespaces))(\(inventory[buyableProducts[i]]!.count)개)")
        }
    }

    func showMenu() {
        print("1. 금액추가")
        print("2. 음료구매")
    }

}
