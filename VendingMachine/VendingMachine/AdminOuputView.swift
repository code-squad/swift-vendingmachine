//
//  AdminOuputView.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 19..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct AdminOutputView {
    static func printAddStockList(_ stock: [Beverage]) {
        print("### 추가할 수 있는 재고는 다음과 같습니다. 번호를 선택해주세요.")
        printStockList(stock)
    }
    static func printPassedValidateStockList(_ stock: [Beverage]) {
        print("### 유통기한이 지난 재고는 다음과 같습니다. 번호를 선택해주세요.")
        printStockList(stock)
    }
    private static func printStockList(_ stock: [Beverage]) {
        for itemIndex in 0..<stock.count {
            print("\(itemIndex + 1)) " + "\(stock[itemIndex].name)")
        }
    }
    static func printAddMsg() {
        print("재고추가완료......")
    }
    static func printError(_ error: String) {
        print(error)
    }

}
