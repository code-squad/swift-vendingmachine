//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct Main {
    let vendingMachine = VendingMachine(with: Stock.prepareStock())
    
    public func run() throws {
        var isContinue = true
        while isContinue {
            OutputView.printSelectMode()
            let mode = try InputView.selectModeType()
            isContinue = try self.selectMode(with: mode)
        }
    }

    public func selectMode(with type : Mode) throws -> Bool {
        switch type {
        case .admin:
            // 관리자 메뉴 선택
            return true
        case .user:
            // 사용자 메뉴 선택
            let userMode = UserMode(with: vendingMachine)
            try userMode.start()
            return true
        case .exit:
            // 종료하기
            return false
        }
    }
}

do {
    // 시작
    let main = Main()
    try main.run()
//    try main.dd()
} catch let error as Errorable {
    OutputView.printError(with: error)
}
