//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 이동영 on 16/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias State = (balence: Money, inventory: Inventory)

struct VendingMachine {
    var isOnSale: Bool {
        return !inventory.filter(by: .all).isEmpty
    }
    private var balance: Money
    private var inventory: Inventory
    private var strategy: StateHandleable?
    
    init(balance: Money,
         inventory: Inventory) {
        self.balance = balance
        self.inventory = inventory
    }
    
    mutating func setStrategy(_ strategy: StateHandleable?) {
        self.strategy = strategy
    }
    
    mutating func execute() throws {
        let state = (balence: balance, inventory: inventory)
        guard let result = strategy?.handle(state) else { return }
        try resultHandle(result)
    }
    
    func handleStrategy(_ handler: (StateHandleable) -> Void) {
        guard
            let strategy = strategy
            else { return }
        handler(strategy)
    }
    
    mutating func resultHandle(_ result: Result<State, Error>) throws {
        switch result {
        case .success(let newState):
            (self.balance, self.inventory) = newState
            self.strategy?.complete()
        case .failure(let error):
            throw error
        }
    }
    
}
// MARK: - + MoneyHandleable
extension VendingMachine: MoneyHandleable {
    
    func handleMoney(_ handler: (Money) -> Void) {
        handler(balance)
    }
    
}
// MARK: - + MoneyHandleable
extension VendingMachine: TupleListHandleable {
    typealias Key = String
    typealias Value = Int
    
    func handleTupleList(_ handler: ([(String, Int)]) -> Void) {
          handler(inventory.statistic)
    }
}
