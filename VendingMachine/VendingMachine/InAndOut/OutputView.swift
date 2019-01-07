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
            print("1) 바나나우유 1500원 \(drinkCount["Banana"] ?? 0)개")
            print("2) 초코우유 1500원 \(drinkCount["Choco"] ?? 0)개")
            print("3) 콜라 2000원 \(drinkCount["Cola"] ?? 0)개")
            print("4) 환타 2000원 \(drinkCount["Fanta"] ?? 0)개")
            print("5) 칸타타 3000원 \(drinkCount["Cantata"] ?? 0)개")
            print("6) TOP 3500원 \(drinkCount["Top"] ?? 0)개")
        }
    }
    
    static func printOrder(of state: State) {
        print(state.rawValue)
    }
}
