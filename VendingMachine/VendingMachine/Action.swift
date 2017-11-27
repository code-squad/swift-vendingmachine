//
//  Action.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 27..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Action {
    var option: Int
    var detail: Int

    init(option: Int, detail: Int) {
        self.option = option
        self.detail = detail
    }
}
