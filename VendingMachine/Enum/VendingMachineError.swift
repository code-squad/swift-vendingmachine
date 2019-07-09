//
//  VendingMachineError.swift
//  VendingMachine
//
//  Created by hw on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct ErrorType{
    static let systemError: String = "[ 시스템 에러 ]"
    static let userError: String = "[ 사용자 에러 ]"
}
enum VendingMachineError: Error, CustomStringConvertible{
    case addDrinkToUnknownMenuNumberError
    case notFoundDrinkIdError
    
    var description: String {
        switch self {
        case .addDrinkToUnknownMenuNumberError:
            return "\(ErrorType.systemError) \n선택한 음료수를 넣을 매팽주소가 잘못 지정되었습니다."
        case .notFoundDrinkIdError:
            return "\(ErrorType.userError) \n메뉴선택이 잘못되었습니다." 
        }
    }
}
