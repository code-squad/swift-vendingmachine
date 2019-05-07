//
//  InputView.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func readInput(ment: String = "") -> String {
        print(ment)
        return readLine() ?? ""
    }
}
