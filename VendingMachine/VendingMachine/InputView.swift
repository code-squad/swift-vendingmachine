//
//  InputView.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    /// 사용자 입력을 받는다
    func getUserInput() -> String {
        return readLine()!
    }
    
    /// 시작 화면
    func startVendingMachine(){
        print("자판기 메인메뉴")
    }
}
