//
//  MenuType.swift
//  VendingMachine
//
//  Created by 이동건 on 23/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum MenuType: String {
    static let description = "\n1. 금액추가\n2. 음료구매\n3. 히스토리\n> "
    
    case deposit = "1"
    case purchase = "2"
    case history = "3"
}
