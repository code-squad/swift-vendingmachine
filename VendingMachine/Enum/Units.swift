//
//  Units.swift
//  VendingMachine
//
//  Created by hw on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Units: String, CustomStringConvertible{
    case won
    case millilter
    
    var description: String {
        switch self {
        case .won:
            return "원"
        case .millilter:
            return "ml"
        }
    }
}
