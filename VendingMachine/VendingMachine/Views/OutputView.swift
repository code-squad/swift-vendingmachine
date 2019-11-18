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
    
    static let showInventory: (Int, String, Int, Int) -> () = { index, name, price, count in
        print("\(index)) \(name) \(price) (\(count))")
    }
    
    static let showPurchase: (Sellable) -> () = { product in
        print("\(product.productName) 구매하셨습니다. \(product.productPrice)원을 차감합니다.")
    }
    
    static func show(failMessage: FailMessage) {
        print(failMessage)
    }
}
