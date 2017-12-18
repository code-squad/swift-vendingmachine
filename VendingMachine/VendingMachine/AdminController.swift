//
//  AdminController.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 14..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct AdminController {
    var admin: VendingMachineAdmin

    init(vendingMachine: VendingMachine) {
        admin = VendingMachineAdmin.init(vendingMachine: vendingMachine)
    }

    mutating func manage() {
        var selector: ValidationChecker.AdminMenu = .none
        while selector == .none {
            showVendingMachine()
            do {
                selector = try ValidationChecker.getAdminSelector(input: InputView.readInput())
            } catch ValidationChecker.Errors.notInMenu {
                print(ValidationChecker.Errors.notInMenu)
                continue
            } catch ValidationChecker.Errors.quit {
                print(ValidationChecker.Errors.quit)
                break
            } catch {
                print(ValidationChecker.Errors.invalidInput)
                continue
            }
            selectMenu(selector: selector)
            selector = ValidationChecker.AdminMenu.none
        }
    }

    private func showVendingMachine() {
        print("\n======= 관리자모드 =======")
        let inventory: Inventory = admin.getInventory()
        if inventory.count == 0 {
            print("현재 자판기에 음료가 없습니다.")
        } else {
            OutputView.show(inventory: inventory)
        }
        OutputView.showAdminMenu()
    }

    mutating private func selectMenu(selector: ValidationChecker.AdminMenu) {
        switch selector {
        case .addProducts:
            addProducts()
        case .removeExpired:
            removeExpired(date: getDate())
        case .salesHistory:
            showSalesHistory()
        default:
            return
        }
    }

    mutating private func addProducts() {
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

        admin.add(product: strawberryMilk)
        admin.add(product: chocolateMilk)
        admin.add(product: bananaMilk)
        admin.add(product: pepciCoke)
        admin.add(product: sprite)
        admin.add(product: fanta)
        admin.add(product: topCoffee)
        admin.add(product: kantata)
        admin.add(product: georgia)
    }

    private func getDate() -> Date {
        print("날짜를 입력하세요. 예) 20171212")
        let input = InputView.readInput()
        return input.getDateFromString()
    }

    private func removeExpired(date: Date) {
        let expiredProducts = admin.getExpiredProducts(date: date)
        for product in expiredProducts {
            admin.remove(product: product)
        }
    }

    private func showSalesHistory() {
        print("지금까지의 판매 내역입니다.")
        print(admin.getSalesHistory())
    }

}
