//
//  UserMode.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 20..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct UserMode<UserServableMachine: UserServable>: ActivateMode {
    typealias MenuType = VendingMachine.Menu
    private let machine: UserServableMachine
    init(_ machine: UserServableMachine) {
        self.machine = machine
    }
    
    func perform() {
        print()
    }
    
    func showResult() {
        print()
    }
    
}
