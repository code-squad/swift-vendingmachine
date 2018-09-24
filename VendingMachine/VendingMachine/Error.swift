//
//  Error.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol Errorable : Error , CustomStringConvertible {
    var description: String { get }
}

enum InputError : Errorable {
    case unknown
    case incorrect
    case empty
    case rangeExceed
    
    var description: String {
        switch self {
        case .unknown:              return "알 수 없는 에러가 발생하였습니다."
        case .incorrect:            return "잘못 입력하셨습니다."
        case .empty:                return "입력값이 비어있습니다."
        case .rangeExceed:          return "입력범위를 초과하였습니다."
        }
    }
}

enum MachineError : Errorable {
    case lackBalance
    
    var description: String {
        switch self {
        case .lackBalance: return "잔액이 부족합니다."
        }
    }
}
