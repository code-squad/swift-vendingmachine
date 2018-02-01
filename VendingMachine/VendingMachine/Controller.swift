//
//  Controller.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 30..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Controller {

    func setVendingMachineStock(unit: Int) -> [ObjectIdentifier: [Beverage]] {
        var stock = [Beverage]()
        let chocoMilk = ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180129")
        let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180128")
        let coke = SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        let americano = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")
        let dolceLatte = Coffee(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20171010")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010")

        for _ in 0..<unit {
            stock.append(chocoMilk)
            stock.append(bananaMilk)
            stock.append(coke)
            stock.append(americano)
            stock.append(dolceLatte)
            stock.append(energyDrink)
        }
        // 추가된 음료를 딕셔너리형태로 정렬
        let productSets = stock.reduce(into: [ObjectIdentifier:[Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
        return productSets
    }


    func run() {
        while true {
        // 음료 기본 세팅되어있는 자판기 생성
        let productSets = setVendingMachineStock(unit: 5)
        let vendingMachine = VendingMachine(stock: productSets)

        // 제공하는 지폐 종류로 입금됐는지 확인후
        let inputView = InputView()
        let billOption = inputView.insertBill(message: InputMessage.insertBill)
        let billInserted = InputChecker().validMoney(input: billOption)
            guard billInserted == 0 else {
                print("금액을 다시 입력해주세요.")
                break
            }
            let inputOption = inputView.askPurchaseOption(message: InputMessage.selectBeverage)
            let checkedOption = InputChecker().validOption(input: inputOption)

        }

    }

}
