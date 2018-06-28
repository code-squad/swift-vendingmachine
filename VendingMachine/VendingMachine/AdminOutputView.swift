//
//  OutputView.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 31..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct AdminOutputView: PrintMessages {
    
    private let vendingmachine: AdminVendingmachine
    
    init(_ vendingmachine: AdminVendingmachine) {
        self.vendingmachine = vendingmachine
    }

    //재고 리스트 보기
    func showInventoryList() -> ([String]) {
        var order = 1
        var kindOfBeverge: [String] = []
        let kind = vendingmachine.makeKindOfBeverage()
        for item in kind {
            let list = vendingmachine[item]
            if let kind = list?.map({$0.kind}) {
                print("\(order))\(kind.first ?? "") (\(kind.count)개)")
                kindOfBeverge.append(kind.first ?? "")
            }
            order += 1
        }
        return kindOfBeverge
    }
    
    func showMessages(_ message: Messages) {
        print(message.rawValue)
    }
    
    func showInputLine() {
        print("> ", terminator: "")
    }
    
}
