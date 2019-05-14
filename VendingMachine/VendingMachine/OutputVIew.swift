//
//  OutputVIew.swift
//  VendingMachine
//
//  Created by 김지나 on 22/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

/// 에러메시지
enum errorMessage: String {
    case unselect = "원하는 번호를 선택해주세요"
}

/// 출력
struct OutputView {
    static func currentStatus(_ money: Int) {
        print("현재 투입한 금액이 \(money)원입니다. 다음과 같은 음료가 있습니다.")
    }
    
    static func menu() {
        print("""
             1. 금액추가
             2. 음료구매
             """)
    }
    
    // 현재 보유 중인 음료수 내역
    func beverageList(_ beverage:VendingMachine) {
        let drinks = beverage.currentBeverageStatus()
        let sortedDrinks = drinks.keys.sorted(by: <)
        for inner in sortedDrinks {
            print("\(inner + 1)) \(drinks[inner]!.0) / \(drinks[inner]!.1)원 / \(drinks[inner]!.2)개")
        }
    }
}
