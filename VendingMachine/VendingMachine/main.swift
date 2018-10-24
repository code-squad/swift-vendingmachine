//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

protocol VendingMachineHandlerDelegate: class {
    associatedtype Menu
    func handle(_ menu: Menu, value: Int) throws -> Comment?
}

class Main {
    private static let beverages: [Beverage] = WareHouse.generateBeverages(10)
    private static let machine = VendingMachine(Stocks(beverages))
    private static let manager = Manager(machine)
    private static let user = User(machine)
    
    static func run() throws {
        let mode = try setMode()
        while true {
            guard let comment = try handle(mode) else { break }
            OutputView.display(with: comment)
        }
        OutputView.display(with: .exit)
    }
    
    // 모드 선택
    private static func setMode() throws -> Mode {
        let mode = try InputView.read(type: Mode.self)
        return mode
    }
    
    // 모드에 따른 메소드 호출
    private static func handle(_ mode: Mode) throws -> Comment? {
        switch mode {
        case .manager:
            let menu = try InputView.read(type: ManagerMenu.self)
            return try manager.handle(menu)
        case .user:
            OutputView.display(with: Comment.introdution(account: user.remain))
            OutputView.display(with: Comment.list(user.bundles, hasPrice: user.remain != 0))
            let (menu, value) = try InputView.readUserInput()
            return try user.handle(menu, value: value)
        }
    }
}

while true {
    do {
        try Main.run()
    } catch let err as VendingMachineError {
        OutputView.display(with: err)
    }
}
