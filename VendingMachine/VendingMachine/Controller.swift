//
//  Controller.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 30..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Controller {

    private func setVendingMachineStock(unit: Int) -> [Beverage] {
        var stock = [Beverage]()
        let chocoMilk = ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180212")
        let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180213")
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

    func run() {
        let productSets = setVendingMachineStock(unit: 3)
        var result = Beverage()
        let vendingMachine = VendingMachine(stockItems: productSets)

        while true {

            let userInput = InputView().askSelectOption(message: "현재 투입한 금액이 \(vendingMachine.showBalance())원입니다. 다음과 같은 음료가 있습니다. \n\(vendingMachine.showStockDefault())")
            guard InputView().checkValid(input: userInput) != [0] else {
                print("메뉴를 다시 입력하세요.")
                continue
            }
            vendingMachine.addBalance(money: userInput[1])
            let buyOption = InputView().askSelectOption(message: "현재 투입한 금액이 \(vendingMachine.showBalance())원입니다. 다음과 같은 음료가 있습니다. \n\(vendingMachine.showStock())")
            guard InputView().checkValid(input: buyOption) != [0] else {
                print("메뉴를 다시 입력하세요.")
                continue
            }
            do {
               result = try vendingMachine.buy(option: buyOption[1])
            } catch let error {
                switch error {
                case VendingMachine.Exception.NotEnoughBalance:
                print("잔액 부족 에러")
                case VendingMachine.Exception.OutOfStock:
                print("품절 에러")
                default: print("unknown Error")
                }
                continue
            }
            print("\(result.type)을 선택하셨습니다. \(result.getPrice())원을 차감합니다.")
            print("History:\n\(vendingMachine.history())")
        }
    }
}
