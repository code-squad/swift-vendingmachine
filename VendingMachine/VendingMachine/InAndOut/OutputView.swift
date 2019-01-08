//
//  OutputView.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printMachineState(of machine: PrintableMachingState) {
        machine.machineState { coin, drinkCount in
            print("\n현재 투입한 금액은 \(coin.convertToString())입니다. 다음과 같은 음료가 있습니다.")
            print(drinkCount)
            print("1) 바나나우유 1500원 \(drinkCount["\(type(of: BananaMilk.self))"] ?? 0)개")
            print("2) 초코우유 1500원 \(drinkCount["\(type(of: ChocoMilk.self))"] ?? 0)개")
            print("3) 콜라 2000원 \(drinkCount["\(type(of: Cola.self))"] ?? 0)개")
            print("4) 환타 2000원 \(drinkCount["\(type(of: Fanta.self))"] ?? 0)개")
            print("5) 칸타타 3000원 \(drinkCount["\(type(of: Cantata.self))"] ?? 0)개")
            print("6) TOP 3500원 \(drinkCount["\(type(of: TOP.self))"] ?? 0)개")
        }
    }
    
    static func printOrder(of state: State) {
        print(state.rawValue)
    }
}
