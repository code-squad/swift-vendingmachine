//
//  AdminMode.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 20..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct AdminMode<ManagableMachine: Managable>: ActivateMode {
    typealias MenuType = VendingMachine.Menu
    private let machine: ManagableMachine
    init(_ machine: ManagableMachine) {
        self.machine = machine
    }
    
    func perform() {
        print()
    }

    func showResult() {
        print()
    }

}
