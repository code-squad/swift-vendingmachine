//
//  InputView.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    func chooseMode() -> ModeType? {
        print(MessageMaker().makeInputViewMessage())
        
        guard let answer = readLine() else { return nil }
        guard let modeType = ModeType(rawValue: Int(answer) ?? 0) else {
            return nil
        }
        
        return modeType
    }
}

