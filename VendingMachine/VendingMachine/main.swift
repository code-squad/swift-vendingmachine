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
    let vendingMachine = VendingMachine()
    
    // 음료수 추가
    _ = vendingMachine.addDrink(drink: ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "저과당초코우유", manufacturingDate: "20171009", lowFat: true, lowSugar: true)!)
    _ = vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDate: "20171005", usingPET: false, zeroCalorie: true)!)
    _ = vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDate: "20171005", usingPET: false, zeroCalorie: true)!)
    _ = vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDate: "20171005", usingPET: false, zeroCalorie: true)!)
    _ =  vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "콜라", manufacturingDate: "20171005", usingPET: false, zeroCalorie: false)!)
    _ = vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "콜라", manufacturingDate: "20171005", usingPET: false, zeroCalorie: false)!)
    _ = vendingMachine.addDrink(drink: TopCoffee(barnd: "맥심", size: 400, price: 3000, name: "TOP아메리카노", manufacturingDate: "20171010", hot: false, zeroSugar: false)!)
    _ = vendingMachine.addDrink(drink: TopCoffee(barnd: "맥심", size: 400, price: 3000, name: "TOP아메리카노", manufacturingDate: "20171010", hot: false, zeroSugar: false)!)
    _ = vendingMachine.addDrink(drink: ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "그냥초코우유", manufacturingDate: "20171009", lowFat: true, lowSugar: false)!)
    _ = vendingMachine.addDrink(drink: ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "그냥초코우유", manufacturingDate: "20171009", lowFat: true, lowSugar: false)!)
    _ = vendingMachine.addDrink(drink: EnergyDrink(barnd: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDate: "20171012", zeroCaffeine: false)!)
    _ = vendingMachine.addDrink(drink: EnergyDrink(barnd: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDate: "20171012", zeroCaffeine: false)!)
    
    /// 아웃풋뷰 선언
    let outputView = OutputView()
    /// 메인메뉴 출력
    outputView.printMessage(message: outputView.welcomMessage())
    
    /// 사용자 모드 선택시
    func userMode()throws{
        outputView.printMessage(message: try outputView.userMenu(vendingMachine: vendingMachine))
        // 메인메뉴를 입력받는다
        let userFirstMenu = try InputView.receiveUserFirstMenu()
        // 메인메뉴에서 선택한 메뉴를 실행
        outputView.printMessage(message: try vendingMachine.getUserMainMenu(menu: userFirstMenu))
    }
    /// 관리자 모드 선택시
    func adminMode()throws{
        outputView.printMessage(message: try outputView.adminMenu(vendingMachine: vendingMachine))
        // 메인메뉴를 입력받는다
        let adminFirstMenu = try InputView.receiveAdminFirstMenu()
        // 메인메뉴에서 선택한 메뉴를 실행
        outputView.printMessage(message: try vendingMachine.getAdminMainMenu(menu: adminFirstMenu))
    }
    /// 모드 선택시
    func selectMode()throws{
        // 모드를 선택한다
        let selectedMode = try InputView.receiveModeSelectMenu()
        while true {
            switch selectedMode {
            case .admin : try adminMode()
            case .user : try userMode()
            case .quit : throw OutputView.errorMessage.quitMessage
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
            outputView.printMessage(message: error.toString())
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


main()

