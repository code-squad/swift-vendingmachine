//
//  main.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

let dateOfManufacture: Date = "20171211".getDateFromString()
var validate: Date = "20171220".getDateFromString()
let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)
validate = "20171215".getDateFromString()
let chocolateMilk = ChocolateMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "초코우유", dateOfManufacture: dateOfManufacture, validate: validate)
let bananaMilk = BananaMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", dateOfManufacture: dateOfManufacture, validate: validate)
let pepciCoke = PepciCoke.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", dateOfManufacture: dateOfManufacture, lowCalorie: true)
let sprite = Sprite.init(brand: "코카콜라", weight: 350, price: 2000, name: "스프라이트", dateOfManufacture: dateOfManufacture, lowCalorie: false)
let fanta = Fanta.init(brand: "코카콜라", weight: 350, price: 2000, name: "환타", dateOfManufacture: dateOfManufacture, lowCalorie: false)
let topCoffee = TOPCoffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", dateOfManufacture: dateOfManufacture, hot: true)
let kantata = Kantata.init(brand: "Kantata", weight: 400, price: 3000, name: "칸타타", dateOfManufacture: dateOfManufacture, hot: true)
let georgia = Georgia.init(brand: "코카콜라", weight: 400, price: 3000, name: "죠지아", dateOfManufacture: dateOfManufacture, hot: false)

var vendingMachine = VendingMachine()
vendingMachine.add(product: strawberryMilk)
vendingMachine.add(product: chocolateMilk)
vendingMachine.add(product: bananaMilk)
vendingMachine.add(product: pepciCoke)
vendingMachine.add(product: sprite)
vendingMachine.add(product: fanta)
vendingMachine.add(product: topCoffee)
vendingMachine.add(product: kantata)
vendingMachine.add(product: georgia)

let outputView = OutputView()
let inputView = InputView()
var inputs: (Int, Int) = (0, 0)
while inputs == (0, 0) {
    let inventory: Inventory = vendingMachine.getInventory()
    let buyableProducts: Array<Category> = vendingMachine.getBuyableProducts()
    if buyableProducts.count == 0 {
        print("현재 금액으로 살 수 있는 음료가 없습니다.")
        outputView.show(inventory: inventory)
    } else {
        outputView.show(balance: vendingMachine.getBalance())
        outputView.show(inventory: inventory, buyableProducts: buyableProducts)
    }
    outputView.showMenu()
    do {
        try inputs = inputView.readInput()
    } catch InputView.Errors.invalidInput {
        print(InputView.Errors.invalidInput.rawValue)
        inputs = (0, 0)
        continue
    } catch InputView.Errors.quit {
        print(InputView.Errors.quit.rawValue)
        break
    }
    switch inputs.0 {
    case 1:
        vendingMachine.insertCoins(inputs.1)
    case 2 where inputs.1 <= buyableProducts.count:
        vendingMachine.buy(category: buyableProducts[(inputs.1)-1])
        print("\(buyableProducts[(inputs.1)-1])를 구매하셨습니다. \(String(describing: inventory[buyableProducts[(inputs.1)-1]]![0].price))원을 차감합니다.")
    case 3:
        print("현재까지 구매 내역입니다.")
        outputView.show(products: vendingMachine.getSalesHistory())
    default:
        print(InputView.Errors.notInMenu.rawValue)
    }
    inputs = (0, 0)
}
