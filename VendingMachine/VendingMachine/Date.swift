//
//  Date.swift
//  VendingMachine
//
//  Created by 김성현 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

extension Date {
    
    enum Month: Int {
        case january = 1
        case february
        case march
        case april
        case may
        case june
        case july
        case august
        case september
        case october
        case november
        case december
    }
    
    init(y: Int, m: Month, d: Int) {
        self = Date()
    }
    
}


