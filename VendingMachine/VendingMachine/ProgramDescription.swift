//
//  ProgramDescription.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum InputMessage: CustomStringConvertible {
    case insertBill
    case selectBeverage

    var description: String {
        switch self {
        case .insertBill:
            return "금액을 투입하세요. (1. 10,000원 | 2. 5,000원 | 3. 1,000원)"
        case .selectBeverage:
            return "음료와 수량을 선택하세요."
        }
    }
}

enum GuideMessage: CustomStringConvertible {
    case selectBeverageAndUnit

    var description: String {
        switch self {
        case .selectBeverageAndUnit:
            return "구매할 음료와 수량을 선택하세요.(공백으로 구분, 숫자 입력)"
        }
    }
}
