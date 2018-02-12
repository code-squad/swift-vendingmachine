//
//  Controller.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 30..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Controller {

    func setVendingMachineStock(unit: Int) -> [Beverage] {
        var stock = [Beverage]()
        let chocoMilk = ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180203")
        let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180128")
        let coke = SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        let americano = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")
        let dolceLatte = DolceLatte(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20171210")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010")

        for _ in 0..<unit {
            stock.append(chocoMilk)
            stock.append(bananaMilk)
            stock.append(coke)
            stock.append(americano)
            stock.append(dolceLatte)
            stock.append(energyDrink)
        }
        return stock
    }

    func newRun() {
        let productSets = setVendingMachineStock(unit: 3)

        while true {
            let vendingMachine = VendingMachine(stockItems: productSets)
            print("현재 투입한 금액이 \(vendingMachine.showBalance())원입니다. 다음과 같은 음료가 있습니다.")
            print(vendingMachine.showStockDefault())
            let inputView = InputView()

            let userInput = inputView.askSelectOption(message: "")
            if userInput[0] == 1 {
                // 금액추가
                vendingMachine.addBalance(money: userInput[1])
            }

            while vendingMachine.showBalance() > 0 {
                print("현재 투입한 금액이 \(vendingMachine.showBalance())원입니다. 다음과 같은 음료가 있습니다.")
                OutputView().show(vendingMachine.showStock())
                let buyOption = inputView.askSelectOption(message: "")
                if buyOption[0] == 2 {
                    let select = vendingMachine.matchKey(buyOption[1])!
                    vendingMachine.buy(itemSelected: select, unit: 1)
                }

            }
        }
    }

    func run() {
        var flag = true
        while flag {
        // 음료 기본 세팅되어있는 자판기 생성
        let productSets = setVendingMachineStock(unit: 3)
        let vendingMachine = VendingMachine(stockItems: productSets)

        // 제공하는 지폐 종류로 입금됐는지 확인후
        let inputView = InputView()
        let billOption = inputView.insertBill(message: InputMessage.insertBill)
        let billInserted = InputChecker().validMoney(input: billOption)
            guard billInserted != 0 else {
                print("금액을 다시 입력해주세요.")
                continue
            }
            vendingMachine.addBalance(money: billInserted)

            // 구매할 수 있는 음료, 잔액과 안내문구 화면에 표시
            OutputView().show(GuideMessage.selectBeverageAndUnit)
            print("\(vendingMachine.showBalance())원이 남아있습니다.")
            OutputView().show(vendingMachine.showStock())

            // 음료와 unit 선택
            let inputOption = inputView.askSelectOption(message: InputMessage.selectBeverage)
            let checkedOption = InputChecker().validOption(input: inputOption)
            let selectProduct = vendingMachine.matchKey(checkedOption.product)

            guard let productCode = selectProduct else {
                print("잘못된 음료 선택")
                continue
            }
            vendingMachine.buy(itemSelected: productCode, unit: checkedOption.unit)
            print("\(vendingMachine.showBalance())원이 남아있습니다.")
            OutputView().show(vendingMachine.showStock())
            break
        }

    }

}
