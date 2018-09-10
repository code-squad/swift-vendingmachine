//
//  DrinkSlot.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation


/// 음료 종류
enum DrinkType{
    case
     lowSugarChocoMilk
    ,chocoMilk
    ,coke
    ,zeroCalorieCoke
    ,hotTopCoffee
    ,energyDrink
    ,none
}

/// 음료 한종류를 가지고 있는 객체
class DrinkSlot<T:Drink> {
    // 음료배열을 가진다
    private var drinks:[T]=[]
    
    // 어떤 음료의 슬롯인지
    let drinkType : DrinkType
    
    init(drinkType:DrinkType){
        self.drinkType = drinkType
    }
    
    /// 음료 추가
    func addDrink(drink:T)throws{
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
    func popDrink()throws->T{
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
        let newDrinkInformation = firstDrink.duplicateSelf() as! T
        
        // 음료정보를 음료로 변환하여 추가한다
        drinks.append(newDrinkInformation)
    }
}












