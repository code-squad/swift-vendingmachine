//
//  InputView.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    enum vendingMachineMenu : Int, generateAllCases {
        case addMoney = 1
        case buyDrink = 2
        case history = 3
        case exit = 4
        case invalidMenu
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
    
    func readMenu() -> vendingMachineMenu {
        let userInput = Int(readLine() ?? "") ?? 0
        guard isPossibleMenu(userInput) else { return .invalidMenu }
        return vendingMachineMenu.init(rawValue: userInput) ?? .invalidMenu
    }
    
    func readMoney() -> Int {
        return Int(readLine() ?? "") ?? 0
    }
    
    func readProductNumber() -> ProductNumber {
        let userInput = Int(readLine() ?? "") ?? 0
        guard isPossibleProductNumber(userInput) else { return .invalidNumber }
        return ProductNumber.init(rawValue: userInput) ?? .invalidNumber
        
    }
    
    private func isPossibleMenu(_ userInput : Int) -> Bool {
        return vendingMachineMenu.allCases.map({$0.rawValue}).contains(userInput)
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
