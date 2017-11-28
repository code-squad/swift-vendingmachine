//
//  Action.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 27..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Action {
    private(set) var option: Option
    enum Option: Int {
        case add = 1
        case delete, exit
    }
    private(set) var detail: Int

    init?(option: Int, detail: Int) {
        switch option {
        case Option.add.rawValue:
            option = .add
        case Option.delete.rawValue:
            option = .delete
        case Option.exit.rawValue:
            option = .exit
        default: return nil
        }
        self.detail = detail
    }
}
