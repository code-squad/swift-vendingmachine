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
            let inventoryDetail = StoredDrinkDetail(drinkName: drink.name, drinkPrice: drink.price, drinkCount: self.drinks.count,drinkType: drink.drinkType)
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
        // 복제해서 추가할 변수
        var newDrink : Drink? = nil
        switch firstDrink {
        case is ChocoMilk : newDrink = (firstDrink as! ChocoMilk).duplicateSelf()
        case is Coke : newDrink = (firstDrink as! Coke).duplicateSelf()
        case is TopCoffee : newDrink = (firstDrink as! TopCoffee).duplicateSelf()
        case is EnergyDrink : newDrink = (firstDrink as! EnergyDrink).duplicateSelf()
        default : throw OutputView.errorMessage.wrongDrink
        }
        // 복사결과가 옵셔널이면 에러출력
        guard let result = newDrink else {
            throw OutputView.errorMessage.wrongDrink
        }
        drinks.append(result)
    }
}












