//
//  InputView.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct InputView {

    static func readInput() -> String {
        guard let input: String = readLine() else { return String() }
        return input
    }

}
