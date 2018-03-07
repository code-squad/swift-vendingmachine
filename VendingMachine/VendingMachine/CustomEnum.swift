//
//  CustomEnum.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 3. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

// 에러 케이스 enum
enum Exception: Error {
    case NotEnoughBalance
    case OutOfStock

    var description: ProgramDescription {
        switch self {
        case .NotEnoughBalance:
            return ProgramDescription.NotEnoughBalance
        case .OutOfStock:
            return ProgramDescription.OutOfStock
        }
    }
}

enum ProgramMode {
    case Admin
    case User
    case None
    case Quit
}

enum AdminMenu {
    case AddItem
    case DeleteItem
    case None
    case Quit
}

enum UserMenu {
    case AddBalance
    case BuyItem
    case None
    case Quit
}


// 음료수의 용기 패키지 타입 enum 선언
enum Package {
    case Can
    case Bottle
    case PET
    case Carton
}


