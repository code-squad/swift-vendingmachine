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

    // 관리자 모드에서 add동작을 위해 필요한 음료수 객체 배열
    private func items(_ index: Int) -> Beverage {
        let beverages = [
            EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010"),
            ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180212"),
            DolceLatte(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20171210"),
            BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180213"),
            Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010"),
            SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        ]
        return beverages[index-1]
    }

    func run() {
        let productSets = setVendingMachineStock(unit: 3)
        var vendingMachine = VendingMachine(stockItems: productSets)
        var runProgram = true

        while runProgram {
            switch InputView().askSelectMode() {

            case .Admin: do {
                vendingMachine = try adminMode(vendingMachine)
            } catch let error {
                switch error {
                case VendingMachine.Exception.OutOfStock:
                    print("재고 없음 - 관리자모드")
                default: print("Unknown error - 관리자모드")
                }
                continue
            }

            case .User: do {
                vendingMachine = try userMode(vendingMachine)
            } catch let error {
                switch error {
                case VendingMachine.Exception.NotEnoughBalance:
                    print("잔액 부족 - 사용자 모드")
                case VendingMachine.Exception.OutOfStock:
                    print("재고 없음 - 사용자 모드")
                default: print("unknown Error - 사용자 모드")
                }
                continue
                }

            case .None:
                print("메뉴를 다시 입력하세요. - default")
                continue

            case .Quit:
                print("## 자판기를 종료합니다. ##\n")
                runProgram = false
                break
            }
        }

    }

    // 관리자 모드
    private func adminMode(_ vendingMachine: VendingMachine) throws -> VendingMachine {
        var run = true
        while run {
            let input = InputView().askAdminExecuteOption(message: "<< 관리자 모드 >>\n원하는 동작과 음료 번호를 선택하세요.\n\(vendingMachine.showStock())\n1. 재고 추가 | 2. 재고 삭제 (띄어쓰기로 구분, 종료를 원하면 공백 입력) \n>>")
            switch input.action {
            case .AddItem: vendingMachine.add(inputItem: self.items(input.option))
            case .DeleteItem: try vendingMachine.removeItem(itemCode: input.option)
            case .None: print("## 관리자 모드 메뉴를 다시 입력해주세요. ##\n")
                continue
            case .Quit: print("## 관리자 모드를 종료합니다. ##\n")
                run = false
            }
        }
        return vendingMachine
    }

    // 사용자 모드
    private func userMode(_ vendingMachine: VendingMachine) throws -> VendingMachine {
        var result = Beverage()
        var input = (action: UserMenu.None, option: 0)
        var run = true

        while run {
            let flag = vendingMachine.hasMiminumBalance()

            // 자판기의 Balance 금액에 따라 사용자에게 보여지는 메뉴 텍스트가 다름
            switch flag {
            case false:
                input = InputView().askUserExecuteOption(message: "현재 투입한 금액이 \(vendingMachine.showBalance())원입니다. 다음과 같은 음료가 있습니다. \n\(vendingMachine.showStockDefault()) \n1. 금액추가 \n2. 음료구매 \n>>")

            case true:
                input = InputView().askUserExecuteOption(message: "현재 투입한 금액이 \(vendingMachine.showBalance())원입니다. 다음과 같은 음료가 있습니다. \n\(vendingMachine.showStock()) \n1. 금액추가 \n2. 음료구매 \n>>")
            }

            let operationType = input.action

            switch operationType {
            case .AddBalance: vendingMachine.addBalance(money: input.option)
            case .BuyItem: result = try vendingMachine.buy(itemCode: input.option)
                print("\(result.type)을 선택하셨습니다. \(result.getPrice())원을 차감합니다.")
                print("History:\n\(vendingMachine.history())")
            case .None:
                print("## 사용자 모드 메뉴를 다시 입력해주세요. ##\n")
                continue
            case .Quit:
                print("## 사용자 모드를 종료합니다. ##\n")
                run = false
                break
            }
        }
        return vendingMachine
    }

}
