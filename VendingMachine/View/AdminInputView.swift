//
//  AdminInputView.swift
//  VendingMachine
//
//  Created by jang gukjin on 12/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct AdminInputView: Input {
    
    /// 안내문구를 출력하고 값을 입력받는 메소드
    func input(items: [Product], menuMent: MenuMent) -> [String] {
        print("관리자 모드 입니다.(0을 입력하면 종료)")
        let result = readInput(items: items, menuMent: menuMent)
        return result
    }
}
