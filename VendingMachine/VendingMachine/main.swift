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

print(strawberryMilk)
print(chocolateMilk)
print(bananaMilk)
print(pepciCoke)
print(sprite)
print(fanta)
print(topCoffee)
print(kantata)
print(georgia)
print(strawberryMilk.validate(with: Date()))
print(pepciCoke.isLowCalorie())
print(topCoffee.isHot())

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
print("남은 금액: \(vendingMachine.getBalance())")
vendingMachine.insertCoins(2000)
print("남은 금액: \(vendingMachine.getBalance())")
let beverage: Beverage? = vendingMachine.buy(category: String(bananaMilk.description.split(separator: "(")[0]))
print("남은 금액: \(vendingMachine.getBalance())")
print("살 수 있는 제품 : \(vendingMachine.getBuyableProducts())")
print("유통기한 지난 제품 : \(vendingMachine.getExpiredProducts(date: "20171217".getDateFromString()))")
print("따뜻한 음료 : \(vendingMachine.getHotProducts())")
print("판매 제품 : \(vendingMachine.getSalesHistory())")
print("모든 제품 :\(vendingMachine.getInventory())")

let outputView = OutputView()
outputView.show(balance: vendingMachine.getBalance())
outputView.show(inventory: vendingMachine.getInventory())
outputView.showMenu()
