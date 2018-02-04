//
//  InputChecker.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 30..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum ValidUnit: Int {
    case TenThousand = 1
    case FiveThousand
    case Thousand

    var money: Int {
        switch self {
        case .TenThousand:
            return 10000
        case .FiveThousand:
            return 5000
        case .Thousand:
            return 1000
        }
    }
}

struct InputChecker {

    func validMoney(input: Int) -> Int {
        let bill = ValidUnit.init(rawValue: input)
        guard let validBill = bill else {
            return 0
        }
        return validBill.money
    }

    func validOption(input: [Int]) -> (product: Int, unit: Int) {
        if (1 <= input[0]) && (input[0] <= 6) && (input[1] > 0) {
            return (product: input[0], unit: input[1])
        }
        return (product: 0, unit: 0)
    }
    // 배열로 리턴하는 것 보다는 변수 레이블을 붙이는게 가독성면에서 좋을 것 같아 튜플 사용.
}
