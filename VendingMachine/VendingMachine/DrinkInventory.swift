//
//  swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

/// 주문된 음료 창고에 관련된 기능들
protocol OrderedDrinkInventory {
    func addInventory(undefinedDrink:Drink)->StoredDrinkDetail?
    func getTotalDrinkDetail()->InventoryDetail
}

/// 음료배열을 여러개 가지는 음료창고
class DrinkInventory {
    /// init
    init(){
        self.drinkSlots.append(DrinkSlot(drinkType: DrinkType.chocoMilk))
        self.drinkSlots.append(DrinkSlot(drinkType: DrinkType.lowSugarChocoMilk))
        self.drinkSlots.append(DrinkSlot(drinkType: DrinkType.coke))
        self.drinkSlots.append(DrinkSlot(drinkType: DrinkType.zeroCalorieCoke))
        self.drinkSlots.append(DrinkSlot(drinkType: DrinkType.hotTopCoffee))
        self.drinkSlots.append(DrinkSlot(drinkType: DrinkType.energyDrink))
    }
    
    /// 슬롯들을 모아놓는 변수 선언
    var drinkSlots : [DrinkSlot<Drink>] = []
    
    /// 초코우유 재고
    private let lowSugarChocoMilkInventory = DrinkSlot(drinkType: DrinkType.lowSugarChocoMilk)
    private let chocoMilkInventory = DrinkSlot(drinkType: DrinkType.chocoMilk)
    
    /// 콜라 재고
    private let cokeInventory = DrinkSlot(drinkType: DrinkType.coke)
    private let zeroCalorieCokeInventory = DrinkSlot(drinkType: DrinkType.zeroCalorieCoke)
    
    /// 커피 재고
    private let hotTopCoffeeInventory = DrinkSlot(drinkType: DrinkType.hotTopCoffee)
    
    /// 에너지드링크 재고
    private let energyDrinkInventory = DrinkSlot(drinkType: DrinkType.energyDrink)
    
    /// 음료객체를 받아서 재고정보로 출력
    func getDrinkDetail(drink: Drink)-> StoredDrinkDetail?{
        let inventoryDetail = StoredDrinkDetail(drink:drink, drinkCount: 1)
        return inventoryDetail
    }
    
    /// 해당타입의 음료를 여러번 추가한다
    func addDrinkSelfDuplicate(drinkType:DrinkType,drinkCount:Int)throws{
        // 음료슬롯 전부를 체크한다
        for drinkSlot in drinkSlots {
            // 음료슬롯의 음료타입이 맞으면
            if drinkSlot.drinkType == drinkType {
                // 입력개수 만큼 증가
                for _ in 1...drinkCount {
                    try drinkSlot.duplicate()
                }
                // 증가 후 반복문 종료
                break
            }
        }
        // 만약 모든 음료슬롯에 해당 타입이 없다면 잘못된음료 에러 리턴
        throw OutputView.errorMessage.wrongDrink
    }
    
    /// 음료수 객체를 받아서 추가
    func addInventory(undefinedDrink:Drink)throws->StoredDrinkDetail?{
        // 음료슬롯 전부를 체크한다
        for drinkSlot in drinkSlots {
            // 음료슬롯의 음료타입이 맞으면
            if drinkSlot.drinkType == undefinedDrink.drinkType {
                // 입력개수 만큼 증가
                try drinkSlot.addDrink(drink: undefinedDrink)
                // 증가 후 반복문 종료
                return StoredDrinkDetail(drink:undefinedDrink ,drinkCount: 1)
            }
        }
        // 만약 모든 음료슬롯에 해당 타입이 없다면 잘못된음료 에러 리턴
        return nil
    }
    
    /// 전체 재고 출력 함수
    func getTotalDrinkDetail()->InventoryDetail{
        // 결과 출력용 변수
        var result = InventoryDetail()
        // 음료슬롯 전부 반복
        for drinkSlot in drinkSlots {
            // 각 음료슬롯의 정보를 추가
            result.takeDrinkDetail(drinkInventory: drinkSlot.getDrinkDetail())
        }
        // 결과 리턴
        return result
    }
    
    /// 음료 여러개 추출
    func popDrinks(drinkType:DrinkType,drinkCount:Int)throws->DrinkSlot<Drink>{
        // 결과 출력용 음료슬롯 생성
        let drinks = DrinkSlot(drinkType: drinkType)
        // 음료슬롯 전부를 체크한다
        for drinkSlot in drinkSlots {
            // 음료슬롯의 음료타입이 맞으면
            if drinkSlot.drinkType == drinkType {
                // 입력개수 만큼 기존 음료슬롯에서 음료를 빼서 결과변수에 추가
                for _ in 1...drinkCount {
                    try drinks.addDrink(drink: drinkSlot.popDrink())
                }
            }
        }
        return drinks
    }    
}




















