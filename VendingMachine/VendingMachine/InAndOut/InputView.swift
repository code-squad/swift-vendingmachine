//
//  InputView.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    private static func input() -> String {
        return readLine() ?? ""
    }
    
    static func selectMenu() -> String {
        print("1.금액추가")
        print("2.음료구매")
        print("> ", terminator: "")
        return input()
    }
}

