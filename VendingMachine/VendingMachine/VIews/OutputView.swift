//
//  OutputView.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    func printResult(mode: ScreenHelper.Mode, answer: Int) {
        guard mode == ScreenHelper.Mode.buyBeverage else { return }
            
        let beverage = makeBeverage(index: answer)
        print("\(beverage.description)를 구매하셨습니다. \(beverage.price.countChange())원을 차감합니다.", terminator: "\n")
    }
    
    private func makeBeverage(index: Int) -> Beverage {
        return allMenus[index-1].makeInstance()
    }
}

