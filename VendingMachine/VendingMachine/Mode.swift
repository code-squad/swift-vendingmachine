//
//  Mode.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/11/21.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum VendingMachineMode: Int, CaseIterable, CustomStringConvertible {
    case managerMode = 1
    case userMode
    
    var description: String {
        switch self {
        case .managerMode:
            return "\(rawValue). 관리자 모드"
        case .userMode:
            return "\(rawValue). 사용자 모드"
        }
    }
}
