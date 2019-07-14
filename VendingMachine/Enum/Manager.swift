//
//  Manager.swift
//  VendingMachine
//
//  Created by jang gukjin on 14/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Manager {
    case quit
    case back
    case proceed
    case error
    
    init(input: String){
        switch input{
        case "0": self = .quit
        case "4": self = .back
        case "1","2","3": self = .proceed
        default: self = .error
        }
    }
}
