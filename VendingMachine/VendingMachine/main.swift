//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main(){
    /// 아웃풋뷰 선언
    let outputView = OutputView()
    /// 인풋뷰 선언
    let inputView = InputView()
    /// 메인메뉴 출력
    outputView.printMessage(message: outputView.welcomMessage())
    /// 자판기 생성
    var vendingMachine : VendingMachine
    do {
        vendingMachine = try makeVendingMachine()
    }
    catch let error as OutputView.errorMessage {
        outputView.printMessage(message: error.description)
        return ()
    }
    catch {
        outputView.printMessage(message: error.localizedDescription)
        return ()
    }
    
    /// 사용자 모드 선택시
    func userMode()throws{
        do {
            // 유저메뉴를 출력한다
            outputView.printMessage(message: try outputView.userMenu(vendingMachine: vendingMachine))
            // 사용자 첫째 메뉴를 입력받는다
            let userFirstMenu = inputView.receiveUserFirstMenu()
            // 입력받은 메뉴를 체크한다
            try Checker.checkUserFirstMenuInput(input: userFirstMenu)
            // 초기정보를 선언한다
            var orderDetail = OrderDetail(drinkType: .none, drinkCount: 0)
            var drinkPrice = 0
            
            // 메뉴에 맞는 초기정보를 작성한다
            // 돈 추가의 경우
            if userFirstMenu == .insertMoney {
                drinkPrice = try inputView.insertMoney()
            } // 음료선택의 경우
            else if userFirstMenu == .selectDrink {
                // 주문정보를 받는다
                orderDetail = try commonDrinkTask()
            }
            
            // 주문정보와 메뉴로 작업함수를 실행한다
            outputView.printMessage(message: try vendingMachine.getUserMainMenu(menu: userFirstMenu, orderDetail: orderDetail, drinkPrice: drinkPrice))
        }
        catch OutputView.errorMessage.wrongMenu {
            outputView.printMessage(message: OutputView.errorMessage.wrongMenu.description)
        }
    }
    
    /// 관리자 모드 선택시 - 이부분 내부에서도 무한반복 필요. 우선 한번만 한다고 가정하고 쭉 짠다.
    func adminMode()throws{
        do {
            outputView.printMessage(message: try outputView.adminMenu(vendingMachine: vendingMachine))
            // 관리자 첫째 메뉴를 입력받는다
            let adminFirstMenu = inputView.receiveAdminFirstMenu()
            // 입력받은 메뉴를 체크한다
            try Checker.checkAdminFirstMenuInput(input: adminFirstMenu)
            
            // 초기정보를 선언한다
            let orderDetail = try commonDrinkTask()
            
            // 주문정보와 메뉴로 작업함수를 실행한다
            outputView.printMessage(message: try vendingMachine.getAdminMainMenu(menu: adminFirstMenu, orderDetail: orderDetail))
        }
        catch OutputView.errorMessage.wrongMenu {
            outputView.printMessage(message: OutputView.errorMessage.wrongMenu.description)
        }
    }
    
    /// 관리자가 음료 제거 선택 시 진행 순서
    func commonDrinkTask() throws -> OrderDetail {
        // 음료번호 입력받음        
        let userNumber = try inputView.whichDrink()
        // 재고정보 추출
        let inventoryDetail = vendingMachine.getAllAvailableDrinks()
        // 메뉴에 있는지 체크 - 리턴값 음료정보
        let selectedDrinkDetail = try inventoryDetail.selectDrinkDetail(drinkNumber: userNumber)
        // 음료개수 입력
        let drinkCount = try inputView.howMany(drink: selectedDrinkDetail.drinkName)
        // 주문정보를 객체로 리턴
        return OrderDetail(drinkType: selectedDrinkDetail.drinkType, drinkCount: drinkCount)
    }
    
    
    /// 모드 선택시
    func selectMode()throws{
        // 모드를 선택한다
        let selectedMode = inputView.receiveModeSelectMenu()
        while true {
            do {
                switch selectedMode {
                case .admin : try adminMode()
                case .user : try userMode()
                case .quit : throw OutputView.errorMessage.quitMessage
                case .none : throw OutputView.errorMessage.wrongMenu
                }
            }
            catch let error as OutputView.errorMessage{
                outputView.printMessage(message: error.description)
                if error == .toModeSelect || error == .wrongMenu || error == .quitMessage {
                    throw error
                }
            }
        }
    }
    
    // 프로그램 시작
    while true {
        do {
            // 메인메뉴 메세지 및 선택지 표시
            try outputView.printMessage(message: outputView.mainMenu(vendingMachine: vendingMachine))
            while true {
                // 모드를 선택한다
                try selectMode()
            }
        } // 에러메세지 출력부분
        catch let error as OutputView.errorMessage {
            // 종료선택 혹은 모든재고 소진시 프로그램 종료
            if error == .noDrinks || error == .quitMessage {
                return ()
            }
        } // 지정된 에러 이외의 에러 발생시
        catch  {
            outputView.printMessage(message: error.localizedDescription)
        }
    }
}

// 자판기 생성 및 음료추가 함수
func makeVendingMachine()throws->VendingMachine {
    let vendingMachine = VendingMachine()
    // 음료수 추가
    _ = try vendingMachine.addDrink(drink: ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "저과당초코우유", manufacturingDateString: "20171009", lowFat: true, lowSugar: true)!)
    _ = try vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDateString: "20171005", usingPET: false, zeroCalorie: true)!)
    _ = try vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDateString: "20171005", usingPET: false, zeroCalorie: true)!)
    _ = try vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDateString: "20171005", usingPET: false, zeroCalorie: true)!)
    _ = try  vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "콜라", manufacturingDateString: "20171005", usingPET: false, zeroCalorie: false)!)
    _ = try vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "콜라", manufacturingDateString: "20171005", usingPET: false, zeroCalorie: false)!)
    _ = try vendingMachine.addDrink(drink: TopCoffee(brand: "맥심", size: 400, price: 3000, name: "TOP아메리카노", manufacturingDateString: "20171010", hot: false, zeroSugar: false)!)
    _ = try vendingMachine.addDrink(drink: TopCoffee(brand: "맥심", size: 400, price: 3000, name: "TOP아메리카노", manufacturingDateString: "20171010", hot: false, zeroSugar: false)!)
    _ = try vendingMachine.addDrink(drink: ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "그냥초코우유", manufacturingDateString: "20171009", lowFat: true, lowSugar: false)!)
    _ = try vendingMachine.addDrink(drink: ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "그냥초코우유", manufacturingDateString: "20171009", lowFat: true, lowSugar: false)!)
    _ = try vendingMachine.addDrink(drink: EnergyDrink(barnd: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDateString: "20171012", zeroCaffeine: false)!)
    _ = try vendingMachine.addDrink(drink: EnergyDrink(barnd: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDateString: "20171012", zeroCaffeine: false)!)
    return vendingMachine
}

main()

