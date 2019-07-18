//
//  AdminOutputView.swift
//  VendingMachine
//
//  Created by hw on 18/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class AdminOutputView {
    
    static func selectAdminMenuInfo(){
        print("\(StateType.addStock.description)")
        print("\(StateType.removeStock.description)")
        print("\(StateType.modeSelect.description)")
    }
    
    static func printDrinkNumberQuantity(){
        print("음료수 번호와 수량을 입력하세요 (ex: 1 15)")
    }
    
    static func printAddStockMessage(name: String, count: String){
        print("\(name)를\(count)개 충전하였습니다.")
    }
    
    static func printRemoveStockMessage(name: String, count: String){
        print("\(name)를\(count)개를 현재 재고에서 비웠습니다.")
    }
    
    static func showCurrentEarningInfo(_ vendingmachie: VendingMachine){
        let printEarningFormat = { (earning: Int) in
            print("현재 자판기 수익은 \(earning)원 입니다.", terminator: " ")
            print("재고 상태는 다음과 같습니다.\n")
        }
        vendingmachie.showCurrentEarningInfo(printFormat: printEarningFormat)
    }
}
