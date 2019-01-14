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
    
    static func select(message: String) -> String {
        print(message, terminator: "")
        return input()
    }
}
