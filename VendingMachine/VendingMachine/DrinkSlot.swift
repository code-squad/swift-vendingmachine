//
//  DrinkSlot.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

/// 음료 한종류를 가지고 있는 객체
class DrinkSlot {
    // 음료배열을 가진다
    private var drinks:[Drink]=[]
    
    // 어떤 음료의 슬롯인지
    let drinkType : DrinkInventory.DrinkType
    
    init(drinkType:DrinkInventory.DrinkType){
        self.drinkType = drinkType
    }
    
    /// 음료 추가
    func addDrink(drink:Drink)throws{
        if drink.drinkType == self.drinkType {
            drinks.append(drink)
        }
        else {
           throw OutputView.errorMessage.wrongDrink
        }
    }
    
    /// 재고 출력
    func getDrinkDetail()-> StoredDrinkDetail?{
        // 재고가 있을경우
        if let drink = self.drinks.first {
            let inventoryDetail = StoredDrinkDetail(drink:drink, drinkCount: self.drinks.count)
            return inventoryDetail
        } // 없을경우
        else {
            return nil
        }
    }
    
    /// 음료 배출
    func popDrink()throws->Drink{
        // 재고 체크
        if drinks.isEmpty {
            throw OutputView.errorMessage.notEnoughDrink
        }
        return drinks.removeFirst()
    }
    
    /// 음료 복제
    func duplicate()throws{
        // 재고가 있을경우
        guard let firstDrink = self.drinks.first
            // 없을경우
            else {
                throw OutputView.errorMessage.notEnoughDrink
        }
        // 복제해서 추가할 음료정보
        var newDrinkInformation : DrinkInformation?
        switch firstDrink {
        case is ChocoMilk : newDrinkInformation = ChocoMilkInformation(chocoMilk: firstDrink as! ChocoMilk)
        case is Coke : newDrinkInformation = CokeInformation(coke: firstDrink as! Coke)
        case is TopCoffee : newDrinkInformation = TopCoffeeInformation(topCoffee: firstDrink as! TopCoffee)
        case is EnergyDrink : newDrinkInformation = EnergyDrinkInformation(energyDrink: firstDrink as! EnergyDrink)
        default : throw OutputView.errorMessage.wrongDrink
        }
        // 복사결과가 옵셔널이면 에러출력
        guard let drinkInformation = newDrinkInformation else {
            throw OutputView.errorMessage.wrongDrink
        }
        // 음료정보를 음료로 변환하여 추가한다
        drinks.append(Drink(drinkInformation: drinkInformation))
    }
}












