//
//  Menu.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol BeverageMenu {
    associatedtype T: CustomStringConvertible
    var menu: T {get set}
}

extension BeverageMenu {
    var description: String {
        return menu.description
    }
}
