//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main(){
    // 자판기 생성
    var vendingMachine = VendingMachine()
    
    // 음료수 생성
    guard
        let lowSugarChocoMilk  = ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "저과당초코우유", manufacturingDate: "20171009", lowFat: true, lowSugar: true)
        ,
        let hot6 = EnergyDrink(
            barnd: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDate: "20171012", zeroCaffeine: false),
        let coke = Coke(barnd: "팹시", size: 350, price: 2000, name: "콜라", manufacturingDate: "20171005", usingPET: false, zeroCalorie: false),
        let topCoffee = TopCoffee(barnd: "맥심", size: 400, price: 3000, name: "TOP아메리카노", manufacturingDate: "20171010", hot: false, zeroSugar: false),
        let chocoMilk  = ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "그냥초코우유", manufacturingDate: "20171009", lowFat: true, lowSugar: false),
        let zeroCalorieCoke = Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDate: "20171005", usingPET: false, zeroCalorie: true)
        else {
            return ()
    }
    // 음료수 추가
    vendingMachine.addDrink(drink: lowSugarChocoMilk)
    vendingMachine.addDrink(drink: lowSugarChocoMilk)
    vendingMachine.addDrink(drink: hot6)
    vendingMachine.addDrink(drink: hot6)
    vendingMachine.addDrink(drink: coke)
    vendingMachine.addDrink(drink: coke)
    vendingMachine.addDrink(drink: zeroCalorieCoke)
    vendingMachine.addDrink(drink: zeroCalorieCoke)
    vendingMachine.addDrink(drink: topCoffee)
    vendingMachine.addDrink(drink: topCoffee)
    vendingMachine.addDrink(drink: chocoMilk)
    vendingMachine.addDrink(drink: chocoMilk)
    
    vendingMachine.addDrink(drink: lowSugarChocoMilk)
    vendingMachine.addDrink(drink: hot6)
    vendingMachine.addDrink(drink: hot6)
    vendingMachine.addDrink(drink: zeroCalorieCoke)
    vendingMachine.addDrink(drink: zeroCalorieCoke)
    vendingMachine.addDrink(drink: topCoffee)
    vendingMachine.addDrink(drink: topCoffee)
    vendingMachine.addDrink(drink: chocoMilk)
    vendingMachine.addDrink(drink: chocoMilk)
    vendingMachine.addDrink(drink: chocoMilk)
    vendingMachine.addDrink(drink: chocoMilk)
    
    /// 인풋뷰 선언
    let inputView = InputView()
    /// 아웃풋뷰 선언
    let outputView = OutputView()
    /// 메인메뉴 출력
    outputView.printMessage(message: outputView.welcomMessage())
    /// 첫번째 스텝 진행 순서
    func mainMenu()->InputView.FirstMenu?{
        // 시작 메세지. 소지금, 구입가능 음료 리스트, 메뉴 출력
        print(outputView.returnMoney(money: vendingMachine.getMoney()))
        print(outputView.returnGettableDrink(drinks: vendingMachine.getAllInventory()))
        print(outputView.firstMenu())
        
        return inputView.receiveFirstMenu()
    }
    
    /// 돈 추가를 선택시 진행순서
    func insertMoneyStep(){
        if let money = inputView.insertMoney() {
            vendingMachine.plusMoney(money: money)
        }
        else {
            outputView.printMessage(message: OutputView.errorMessage.notNumeric.rawValue)
        }
    }
    
    /// 음료선택시 재고가 남아있는지 체크후 해당 음료의 정보를 가저온다
    func getInventoryDetail(drinkNumber:InputView.DrinkNumber)->InventoryDetail?{
        // 메뉴번호-1 이 실제 배열임
        guard let drinkDetail : InventoryDetail = vendingMachine.getAllInventory()[drinkNumber.rawValue-1] else {
            // 음료재고가 0이면 에러
            outputView.printMessage(message: OutputView.errorMessage.notEnoughDrink.rawValue)
            return nil
        }
        return drinkDetail
    }
    
    /// 원하는 수량이 >0 인지 체크
    func receiveOrderCount(drinkName:String)->Int?{
        guard let orderCount = inputView.howMany(drink: drinkName) else {
            outputView.printMessage(message: OutputView.errorMessage.notNumeric.rawValue)
            return nil
        }
        return orderCount
    }
    
    /// 원하는 수량이 재고와 맞는지 체크
    func checkEnoughDrinkCount(drinkCount:Int,orderCount:Int)->Bool{
        guard drinkCount >= orderCount else {
            outputView.printMessage(message: OutputView.errorMessage.notEnoughDrink.rawValue)
            return false
        }
        return true
    }
    
    /// 음료번호를 받아서 음료타입으로 리턴
    func drinkNumberToType(drinkNumber:InputView.DrinkNumber)->DrinkInventory.DrinkType{
        switch drinkNumber {
        case .one : return DrinkInventory.DrinkType.lowSugarChocoMilk
        case .two : return DrinkInventory.DrinkType.chocoMilk
        case .three : return DrinkInventory.DrinkType.coke
        case .four : return DrinkInventory.DrinkType.zeroCalorieCoke
        case .five : return DrinkInventory.DrinkType.hotTopCoffee
        case .six : return DrinkInventory.DrinkType.energyDrink
        }
    }
    
    /// 음료 선택후 구매 진행과정
    func buyingDrink(drinkNumber:InputView.DrinkNumber){
        /// 구매가 가능한지 체크한다
         // 구매하려는 음료가 잔고가 있는지
        guard let drinkDetail = getInventoryDetail(drinkNumber: drinkNumber)
            // 원하는 수량이 >0 인지
            , let orderCount = receiveOrderCount(drinkName: drinkDetail.drinkName)
            else {
                // 하나라도 잘못되면 단계 취소
                return ()
        }
        // 돈 계산
        if vendingMachine.calculateMoney(drink: drinkDetail,orderCount:orderCount) == false {
            return ()
        }
        // 입력받은 음료 번호를 음료 타입으로 변환
        let drinkType = drinkNumberToType(drinkNumber: drinkNumber)
        // 인벤토리->주문내역 으로 음료 이동
        let result = vendingMachine.orderDrinks(drinkType:drinkType, drinkCount: orderCount)
        // 결과를 출력
        outputView.printMessage(message: outputView.buyingResult(drinkDetail: result))
        
    }
    
    /// 음료 선택 시 진행 순서
    func selectDrink(){
        // 음료 번호 선택 매뉴 알림 메세지
        print(outputView.whichDrink())
        // 음료 번호를 선택한다. 1~Checker.maxDrinuNumber 사이면 통과
        if let selectedDrinkNumber = inputView.receiveDrinkNumberMenu() {
            // 음료 구매가 진행된다
            buyingDrink(drinkNumber: selectedDrinkNumber)
        } // 잘못된 선택일 경우
        else {
            outputView.printMessage(message: OutputView.errorMessage.wrongMenu.rawValue)
        }
    }
    // 프로그램 시작
    while true {
        // 유저입력값을 첫번째 메뉴로 치환한다
        if let firstMenu = mainMenu() {
            switch firstMenu {
            case .insertMoney : insertMoneyStep()
            case .selectDrink : selectDrink()
            case .quit :
                // 종료를 선택하면 종료메세지 후 리턴
                outputView.printMessage(message: OutputView.errorMessage.quitMessage.rawValue)
                return ()
            }
        } // 잘못된 메뉴 선택시
        else {
            outputView.printMessage(message: OutputView.errorMessage.wrongMenu.rawValue)
        }
    }
}


main()

