//
//  OutputView.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/11/07.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static let showBalance: (Money) -> () = { balance in
        print("현재 투입한 금액이 \(balance)입니다.")
    }
    
    static let showInventory: ([(product: Sellable, count: Int)]) -> () = { inventory in
        print("다음과 같은 음료가 있습니다.")
        
        for (index, stock) in inventory.enumerated() {
            print("\(index + 1)) \(stock.product.productName) \(stock.product.productPrice) (\(stock.count))")
        }
    }
    
    static let showPurchase: (Sellable) -> () = { product in
        print("\(product.productName) 구매하셨습니다. \(product.productPrice)원을 차감합니다.")
    }
    
    static func printInvalidInputMessage() {
        print("잘못된 입력")
    }
    
    static func printUnableToPurchaseMessage() {
        print("상품 구매 불가")
    }
}
