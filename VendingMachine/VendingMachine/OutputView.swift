//
//  OutputView.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 11..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct OutputView {

    static func show(balance: Int) {
        print("현재 사용할 수 있는 금액이 \(balance)원 입니다.")
    }

    static func show(products: Products) {
        for product in products {
            print(product)
        }
    }

    static func show(inventory: Inventory) {
        print("다음과 같은 음료가 있습니다.")
        var count: Int = 0
        for (key, value) in inventory {
            count += 1
            print("\(count)) \(key) \(value[0].price)원(\(value.count)개)")
        }
    }

    static func show(inventory: Inventory, buyableProducts: Array<Category>) {
        print("다음과 같은 음료를 살 수 있습니다.")
        for i in 0..<buyableProducts.count {
            print("\(i+1)) \(buyableProducts[i]) \(inventory[buyableProducts[i]]![0].price)원(\(inventory[buyableProducts[i]]!.count)개)")
        }
    }

    static func showMenu() {
        print("\n1. 금액추가 (예: 1 10000)")
        print("2. 음료구매 (예: 2 2)")
        print("3. 구매내역확인")
    }

    static func showMode() {
        print("\n자판기를 시작합니다.")
        print("1. 관리자 모드")
        print("2. 사용자 모드")
    }

    static func showAdminMenu() {
        print("\n1. 음료 채우기")
        print("2. 유통기한 지난 음료 제거")
        print("3. 판매내역확인")
    }

}
