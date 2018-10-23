//
//  InputView.swift
//  VendingMachine
//
//  Created by 이동건 on 18/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class InputView {
    static func read() -> String? {
        print(MenuType.description, terminator: "")
        return readLine()
    }
}
