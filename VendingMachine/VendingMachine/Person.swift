//
//  Person.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 23..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

protocol Person {
    mutating func action(option: Int, detail: Int) throws -> Drink?
}
