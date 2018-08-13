//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 7. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation



class VendingMachine {
    /// 자판기에 들어있는 금액
    private var insertedMoney = 0
    
    /// 금액 추가 함수
    func plusMoney(money:Int){
        self.insertedMoney += money
    }
    /// 금액 사용 함수
    func minusMoney(money:Int){
        self.insertedMoney -= money
    }
    /// 금액 확인 함수
    func getMoney()->Int{
        return self.insertedMoney
    }
    
    /// 재고창고
    private var drinkInventory = DrinkInventory()
    
    /// 주문한 음료수가 쌓이는 곳
    private var orderedDrinks : [Drink] = []
    
    /// 주문한 음료수 전체 내용 리턴
    func getOrederdDrinks()->[Drink]{
        return orderedDrinks
    }
    
    /// 종류별 음료수 주문
    func orderLowSugarChocoMilk()->()?{
        // 재고가 없으면 닐 리턴
        guard let drink = drinkInventory.popLowSugarChocoMilk() else {
            return nil
        }
        orderedDrinks.append(drink)
        return ()
    }
    func orderChocoMilk()->()?{
        // 재고가 없으면 닐 리턴
        guard let drink = drinkInventory.popChocoMilk() else {
            return nil
        }
        orderedDrinks.append(drink)
        return ()
    }
    func orderCoke()->()?{
        // 재고가 없으면 닐 리턴
        guard let drink = drinkInventory.popCokeInventory() else {
            return nil
        }
        orderedDrinks.append(drink)
        return ()
    }
    func orderZeroCalorieCoke()->()?{
        // 재고가 없으면 닐 리턴
        guard let drink = drinkInventory.popZeroCalorieCokeInventory() else {
            return nil
        }
        orderedDrinks.append(drink)
        return ()
    }
    func orderHotTopCoffee()->()?{
        // 재고가 없으면 닐 리턴
        guard let drink = drinkInventory.popHotTopCoffeeInventory() else {
            return nil
        }
        orderedDrinks.append(drink)
        return ()
    }
    func orderEnergyDrink()->()?{
        // 재고가 없으면 닐 리턴
        guard let drink = drinkInventory.popEnergyDrinkInventory() else {
            return nil
        }
        orderedDrinks.append(drink)
        return ()
    }
    
    
    /// 재고 추가
    func addDrink(drink:Drink)->InventoryDetail?{
        return self.drinkInventory.addInventory(undefinedDrink: drink)
    }
    
    /// 남아있는 모든 재고 확인
    func getAllInventory()->[InventoryDetail?]{
        return drinkInventory.getTotalDrinkDetail()
    }
    
    /// 주문한 모든 음료 확인
    func getAllOrderdDrink()->[String]{
        var result : [String] = []
        for drink in  orderedDrinks {
            result.append(drink.description)
        }
        return result
    }
    
}

