//
//  UserOutputVIew.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct UserView {
    private let messageMaker: MessageMaker
    
    init() {
        self.messageMaker = MessageMaker()
    }
    
    func printUserViewMessage(_ machine: Userable & InventoryCountable) {
        print(messageMaker.makeUserViewMessage(machine))
    }
}
