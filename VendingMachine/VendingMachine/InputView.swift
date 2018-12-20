//
//  InputView.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 20..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func readInput(ment: String) -> String {
        print(ment, terminator:"")
        return readLine() ?? ""
    }
}
