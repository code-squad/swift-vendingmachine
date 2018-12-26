//
//  BeverageFactory.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 26..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol BeverageFactory {
    func produce() -> Beverage
}
