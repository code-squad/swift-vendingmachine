//
//  OutputView.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printState(of machine: PrintableMachingState) {
        machine.machineState { coin, drinkCount in
            print("현재 투입한 금액은 \(coin)입니다. 다음과 같은 음료가 있습니다.")
            print("1) 바나나우유 1000원 \(drinkCount.0)개")
            print("2) 초코우유 1500원 \(drinkCount.1)개")
            print("3) 콜라 1000원 \(drinkCount.2)개")
            print("4) 환타 1200원 \(drinkCount.3)개")
            print("5) 칸타타 2000원 \(drinkCount.4)개")
            print("6) TOP 2500원 \(drinkCount.5)개")
        }
    }
}
