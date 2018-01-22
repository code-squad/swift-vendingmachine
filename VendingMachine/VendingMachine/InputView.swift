//
//  InputView.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    enum Mode : Int, generateAllCases {
        case admin = 1
        case user = 2
        case exit = 3
        case invalidMode
    }
    
    enum adminMenu : Int, generateAllCases {
        case addProduct = 1
        case removeProduct = 2
        case history = 3
        case exit = 4
        case invalidAdminMenu
    }
    
    enum userMenu : Int, generateAllCases {
        case addMoney = 1
        case buyDrink = 2
        case exit = 3
        case invalidUserMenu
    }
    
    enum ProductNumber : Int, generateAllCases {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case invalidNumber
    }
    
    func readMode() -> Mode {
        let userInput = Int(readLine() ?? "") ?? 0
        guard isPossibleMode(userInput) else { return .invalidMode }
        return Mode.init(rawValue: userInput) ?? .invalidMode
    }
    
    func readAdminMenu() -> adminMenu {
        let userInput = Int(readLine() ?? "") ?? 0
        guard isPossibleAdminMenu(userInput) else { return .invalidAdminMenu }
        return adminMenu.init(rawValue: userInput) ?? .invalidAdminMenu
    }
    
    func readUserMenu() -> userMenu {
        let userInput = Int(readLine() ?? "") ?? 0
        guard isPossibleUserMenu(userInput) else { return .invalidUserMenu }
        return userMenu.init(rawValue: userInput) ?? .invalidUserMenu
    }
    
    func readMoney() -> Int {
        return Int(readLine() ?? "") ?? 0
    }
    
    func readProductNumber() -> ProductNumber {
        let userInput = Int(readLine() ?? "") ?? 0
        guard isPossibleProductNumber(userInput) else { return .invalidNumber }
        return ProductNumber.init(rawValue: userInput) ?? .invalidNumber
        
    }
    
    private func isPossibleMode(_ userInput : Int) -> Bool {
        return Mode.allCases.map({$0.rawValue}).contains(userInput)
    }
    
    private func isPossibleAdminMenu(_ userInput : Int) -> Bool {
        return adminMenu.allCases.map({$0.rawValue}).contains(userInput)
    }
    
    private func isPossibleUserMenu(_ userInput : Int) -> Bool {
        return userMenu.allCases.map({$0.rawValue}).contains(userInput)
    }
    
    private func isPossibleProductNumber(_ userInput : Int) -> Bool {
        return ProductNumber.allCases.map({$0.rawValue}).contains(userInput)
    }
    
}

protocol generateAllCases : Hashable {
    static func cases() -> AnySequence<Self>
    static var allCases: [Self] { get }
}

extension generateAllCases {
    
    static func cases() -> AnySequence<Self> {
        return AnySequence { () -> AnyIterator<Self> in
            var raw = 0
            return AnyIterator {
                let current: Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else {
                    return nil
                }
                raw += 1
                return current
            }
        }
    }
    
    static var allCases: [Self] {
        return Array(self.cases())
    }
}
