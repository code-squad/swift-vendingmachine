//
//  InputView.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct InputView {

    private static func listForm(name: String, stock: Int) {
        print("\(name)(\(stock)개)", separator: " ")
    }

    static func showBeverageList(of vendingMachine: VendingMachine){
        vendingMachine.showListOfAll(with: listForm(name:stock:))
    }
}
