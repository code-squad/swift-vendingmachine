//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 7. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
/// 자판기의 기본적인 메뉴
protocol vendinMachineMenu {
    func getMoney()->Int
    func getAllAvailableDrinks()->InventoryDetail
    func addDrink(drink:Drink)throws->StoredDrinkDetail?
}
/// 사용자용 메뉴
protocol VendingMachineUserMenu : vendinMachineMenu {
    func getUserMainMenu(menu:InputView.UserFirstMenu)throws->String
}
/// 관리자용 메뉴
protocol VendingMachineAdminMenu : vendinMachineMenu {
    func getAdminMainMenu(menu:InputView.AdminFirstMenu)throws->String
}

class VendingMachine : vendinMachineMenu  {
    /// 자판기에 들어있는 금액
    private var insertedMoney = 0
    
    /// 금액 추가 함수
    func plusMoney(money:Int)->String{
        self.insertedMoney += money
        return "\(money)원을 추가하였습니다."
    }
    /// 금액 사용 함수
    func minusMoney(money:Int){
        self.insertedMoney -= money
    }
    /// 금액 출력 함수
    func getMoney()->Int{
        return self.insertedMoney
    }
    
    /// 재고창고
    private var drinkInventory = DrinkInventory()
    
    /// 주문한 음료수가 쌓이는 곳
    private var orderedDrinks = DrinkInventory()
    
    /// 주문한 음료수 전체 내용 리턴
    func getAllOrderdDrink()->String{
        return orderedDrinks.getTotalDrinkDetail().getAllDrinkDetails()
    }
    
    /// 재고 추가
    func addDrink(drink:Drink)throws->StoredDrinkDetail?{
        return try self.drinkInventory.addInventory(undefinedDrink: drink)
    }
    
    /// 남아있는 모든 재고 확인
    func getAllAvailableDrinks()->InventoryDetail{
        return drinkInventory.getTotalDrinkDetail()
    }
    
    /// 금액 차감 기능
    func calculateMoney(drink:StoredDrinkDetail,orderCount:Int)->Bool{
        if self.getMoney() >= drink.drinkPrice*orderCount {
            // 금액 차감
            self.minusMoney(money: drink.drinkPrice*orderCount)
            return true
        } // 금액부족
        else {
            return false
        }
    }
    
    /// 음료번호를 입력받아서 해당 음료의 재고정보를 리턴한다
    func selectDrink()throws->StoredDrinkDetail{
        // 음료 번호를 선택한다. 입력값이 재고번호에 있으면 통과
        let orderDrinkNumber = try receiveDrinkNumber()
        // 원하는 음료의 정보를 담는 변수. 실제메뉴번호-1 -> 배열인덱스 이므로 -1 을 해준다.
        let storedDrinkDetail = self.getAllAvailableDrinks().storedDrinksDetail
        // 결과 리턴
        return storedDrinkDetail[orderDrinkNumber-1]
    }
    
    /// 원하는 음료의 가격을 잔액과 배교한다
    func isEnoughMoney(storedDrinkDetail:StoredDrinkDetail,orderDrinkCount:Int)throws->Int{
        // 총 주문금액 변수
        let totalOrderPrice = orderDrinkCount * storedDrinkDetail.drinkPrice
        // 입력된금액 < 주문금액 이면 에러
        if self.getMoney() < totalOrderPrice {
            throw OutputView.errorMessage.notEnoughMoney
        }
        return totalOrderPrice
    }
    
    /// 유저입력을 받아서 재고번호에 있으면 해당 재고의 음료타입을 리턴
    func receiveDrinkNumber() throws -> Int {
        let orderDrinkNumber = try Checker.isRightDrinkNumber(orderDrinkNumber: InputView.whichDrink(), inventoryDetail:self.getAllAvailableDrinks() )
        return orderDrinkNumber
    }
}

extension VendingMachine : VendingMachineUserMenu {
    /// 음료주문 기능
    func orderDrinks(drinkType:DrinkType,drinkCount:Int)throws->StoredDrinkDetail{
        // 음료타입과 개수를 받아서 해당 음료를 재고에서 빼낸다
        let movedDrinks = try drinkInventory.popDrinks(drinkType: drinkType, drinkCount: drinkCount)
        // 이동된 음료를 주문리스트에 넣고 옮겨진 음료정보를 기록한다
        let movedDrinksDetail : StoredDrinkDetail = try self.orderedDrinks.addDrinks(drinks: movedDrinks)
        // 옮겨진 음료정보를 리턴한다
        return movedDrinksDetail
    }
    
    /// 유저가 음료 선택 시 진행 순서
    func buyDrink() throws ->String {
        // 음료 번호를 선택한다. 입력값이 재고번호에 있으면 통과. 음료의 재고정보를 리턴받는다
        let storedDrinkDetail = try selectDrink()
        
        // 원하는 개수를 입력받는다
        let orderDrinkCount = try InputView.howMany(drink: storedDrinkDetail.drinkName)
//            try isEnoughDrink(storedDrinkDetail: storedDrinkDetail)
        
        // 총 주문금액 변수
        let totalOrderPrice = try drinkInventory.calculatePrice(orderCount: orderDrinkCount, balance: self.getMoney(), drinkType: storedDrinkDetail.drinkType)
        
        // 금액 사용
        self.minusMoney(money: totalOrderPrice)
        
        
        // 인벤토리->주문내역 으로 음료 이동. 이동된 음료의 정보 저장
        let movedDrinksDetail = try orderDrinks(drinkType:storedDrinkDetail.drinkType, drinkCount: orderDrinkCount)
        
        // 완료 메세지 리턴
        return "\(movedDrinksDetail.drinkName) \(movedDrinksDetail.drinkCount)개를 \(totalOrderPrice)원에 구입하였습니다."
    }
    
    /// 메인메뉴에서 선택 후 분기
    func getUserMainMenu(menu: InputView.UserFirstMenu) throws -> String{
        switch menu {
        case .insertMoney : return plusMoney(money: try InputView.insertMoney())
        case .selectDrink : return try buyDrink()
        case .quit : throw OutputView.errorMessage.toModeSelect
        case .none : return OutputView.errorMessage.wrongMenu.description
        }
    }
}

extension VendingMachine : VendingMachineAdminMenu {
    /// 음료 다수 제거 기능
    func removeDrinks(drinkType:DrinkType,drinkCount:Int)throws->StoredDrinkDetail?{
        // 음료타입과 개수를 받아서 해당 음료를 리스트로 옮긴다
        let movedDrinks = try drinkInventory.popDrinks(drinkType: drinkType, drinkCount: drinkCount)
        // 리스트의 정보를 출력한다
        return movedDrinks.getDrinkDetail()
    }
    
    /// 관리자가 음료 제거 선택 시 진행 순서
    func reduceDrink() throws ->String {
        // 음료 번호를 선택한다. 입력값이 재고번호에 있으면 통과. 음료의 재고정보를 리턴받는다
        let storedDrinkDetail = try selectDrink()
        
        // 원하는 개수를 입력받는다
        let orderDrinkCount = try InputView.howMany(drink: storedDrinkDetail.drinkName)
        
        // 음료 제거. 제거된 음료의 정보 저장
        guard let movedDrinkDetail = try removeDrinks(drinkType: storedDrinkDetail.drinkType, drinkCount: orderDrinkCount) else {
            throw OutputView.errorMessage.notEnoughDrink
        }        
        // 완료 메세지 리턴
        return "\(movedDrinkDetail.drinkName) \(movedDrinkDetail.drinkCount)개를 제거하였습니다."
    }
    
    /// 관리자가 음료 추가 선택시
    func duplicateDrink() throws->String{
        // 음료 번호를 선택한다. 입력값이 재고번호에 있으면 통과. 음료의 재고정보를 리턴받는다
        let storedDrinkDetail = try selectDrink()
        
        // 원하는 개수를 입력받는다
        let orderDrinkCount = try InputView.howMany(drink: storedDrinkDetail.drinkName)
        
        // 음료 추가.
        try drinkInventory.addDrinkSelfDuplicate(drinkType: storedDrinkDetail.drinkType, drinkCount: orderDrinkCount)
        
        // 완료 메세지 리턴
        return "\(storedDrinkDetail.drinkName) \(orderDrinkCount)개를 추가하였습니다."
    }
    
    
    func getAdminMainMenu(menu: InputView.AdminFirstMenu) throws -> String {
        switch menu {
        case .addDrink : return try duplicateDrink()
        case .removeDrink : return try reduceDrink()
        case .quit : throw OutputView.errorMessage.toModeSelect
        case .none : return OutputView.errorMessage.wrongMenu.description
        }
    }
}
