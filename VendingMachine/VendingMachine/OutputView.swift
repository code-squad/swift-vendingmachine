//
//  OutputView.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 31..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    
    enum Messages: String {
        case memu = "1. 금액추가\n2. 음료구매\n3. 구매이력 확인\n4. 종료"
        case addMoney = "투입할 금액을 입력해주세요."
        case chooseBeverage = "구매하실 음료번호를 입력해주세요."
        case invalidMenu = "잘못된 번호를 입력하셨습니다. 다시 입력해주세요."
        case lowBalance = "잔액이 부족합니다."
    }
    
    func showInformation(_ coin: Vendingmachine) {
        print("현재 투입한 금액이 \(coin.checkBalance())원 입니다. 다음과 같은 음료가 있습니다.")
    }
    
    
    
    
    
}
