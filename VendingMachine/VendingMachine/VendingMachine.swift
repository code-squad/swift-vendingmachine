//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 7. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    /// 자판기에 들어있는 금액
    private var insertedMoney = 0
    
    /// 금액 추가 함수
    func plusMoney(money:Int){
        self.insertedMoney += money
    }
    /// 금액 사용 함수
    func minusMoney(money:Int){
        self.insertedMoney -= money
    }
    
    
}
