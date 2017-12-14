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

let vendingMachine: VendingMachine = VendingMachine.init()
var user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachine)
var admin: VendingMachineAdmin = VendingMachineAdmin.init(vendingMachine: vendingMachine)
admin.add(product: strawberryMilk)
admin.add(product: chocolateMilk)
admin.add(product: bananaMilk)
admin.add(product: pepciCoke)
admin.add(product: sprite)
admin.add(product: fanta)
admin.add(product: topCoffee)
admin.add(product: kantata)
admin.add(product: georgia)

let outputView = OutputView()
let inputView = InputView()
let validationChecker = ValidationChecker()
var selector: (ValidationChecker.VendingMenu, Int) = (ValidationChecker.VendingMenu.none, 0)
while selector.0 == ValidationChecker.VendingMenu.none {
    print("\n======= 자판기 =======")
    let inventory: Inventory = user.getInventory()
    let buyableProducts: Array<Category> = user.getBuyableProducts()
    if buyableProducts.count == 0 {
        print("현재 금액으로 살 수 있는 음료가 없습니다.")
        outputView.show(inventory: inventory)
    } else {
        outputView.show(balance: user.getBalance())
        outputView.show(inventory: inventory, buyableProducts: buyableProducts)
    }
    outputView.showMenu()
    do {
        selector = try validationChecker.getSelector(input: inputView.readInput())
    } catch ValidationChecker.Errors.invalidInput {
        print(ValidationChecker.Errors.invalidInput)
        continue
    } catch ValidationChecker.Errors.quit {
        print(ValidationChecker.Errors.quit)
        break
    }
    switch selector.0 {
    case .insertCoins:
        user.insertCoins(selector.1)
    case .buyProduct where selector.1 <= buyableProducts.count:
        user.buy(category: buyableProducts[selector.1-1])
        print("\(buyableProducts[selector.1-1])를 구매하셨습니다. \(String(describing: inventory[buyableProducts[selector.1-1]]![0].price))원을 차감합니다.")
    case .salesHistory:
        print("현재까지 구매 내역입니다.")
        outputView.show(products: user.purchaseList)
    default:
        continue
    }
    selector = (ValidationChecker.VendingMenu.none, 0)
}
