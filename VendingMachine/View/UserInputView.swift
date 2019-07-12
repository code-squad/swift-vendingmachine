//
//  InputView.swift
//  VendingMachine
//
//  Created by jang gukjin on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct UserInputView: Input {

    /// 안내문구를 출력하고 값을 입력받는 메소드
    func input(items: [Product], money: Int, menuMent: MenuMent) -> [String] {
        print("현재 투입한 금액이 \(money)원 입니다. 다음과 같은 음료가 있습니다.(0을 입력하면 종료)")
        let result = readInput(items: items, menuMent: menuMent)
        return result
    }
}
