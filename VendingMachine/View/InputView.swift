//
//  InputView.swift
//  VendingMachine
//
//  Created by jang gukjin on 12/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    /// 안내문구를 출력하고 값을 입력받는 메소드
    static func readInput() -> MenuMent {
        var answer: String = ""
        var menu = MenuMent(of: "Quit")
        while true {
            print("""
                자판기를 시작합니다. (0을 입력하면 종료)
                1. 관리자 모드
                2. 사용자 모드
                >>
                """, terminator: "")
            answer = readLine() ?? ""
            if answer == "1" {
                menu = MenuMent(of: "admin")
                break
            } else if answer == "2" {
                menu = MenuMent(of: "user")
                break
            } else if answer == "0" {
                break
            } else {
                print("범위 내의 숫자를 입력해주세요")
            }
        }
        return menu
    }
}
