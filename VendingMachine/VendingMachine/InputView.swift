//
//  InputView.swift
//  VendingMachine
//
//  Created by CHOMINJI on 17/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func readAnswer(for question: String) -> Int {
        print(question)
        let prompt = readLine() ?? ""
        let answer = Int(prompt) ?? -1
        return answer
    }
}
