//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let strawBerryMilk = StrawBerryMilk(productTpye: "딸기우유",
                                    brand: "서울우유",
                                    weight: "200ml",
                                    price: "1000원",
                                    name: "날마다딸기우유",
                                    dateOfManufacture: "20171009",
                                    calorie: "300kcal",
                                    ingredients: ["strawBerrySyrup"],
                                    ratioOfStrawBerrySyrup: "3.2%")
let bananaMilk = BananaMilk(productTpye: "바나나우유",
                            brand: "서울우유",
                            weight: "200ml",
                            price: "1000원",
                            name: "날마다딸기우유",
                            dateOfManufacture: "20171012",
                            calorie: "350kcal",
                            ingredients: ["bananaSyrup"],
                            ratioOfBananaSyrup: "2.5%")
let coke = Coke(productTpye: "콜라",
                calorie: "200kcal",
                brand: "팹시",
                weight: "350ml",
                price: "2000원",
                name: "다이어트콜라",
                dateOfManufacture: "20171005",
                amountOfSugar: "50g")
let coffee = Coffee(productTpye: "커피", calorie: "150kcal",
                    brand: "맥심",
                    weight: "400ml",
                    price: "3000원",
                    name: "TOP아메리카노",
                    dateOfManufacture: "20171010",
                    isHot: true,
                    amountOfCaffeine: "30mg",
                    nameOfCoffeeBeans: "Colombia")
print(strawBerryMilk!)
print(bananaMilk!)
print(coke!)
print(coffee!)

