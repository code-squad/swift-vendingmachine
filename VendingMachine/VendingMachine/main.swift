//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    
    let beverages = [Sprite(), Sprite(), Sprite(), CocaCola(), CocaCola(), CocaCola(), CocaCola(),ChocolateMilk(), ChocolateMilk(), BananaMilk(),CantataCoffee(), CantataCoffee(), CantataCoffee(), StarbucksCoffee(),StarbucksCoffee()]
    
    var vendingMachine = VendingMachine(startMoney: 500, list: Inventory(list: [:]))
    
    beverages.forEach {
        beverage in vendingMachine.add(beverage: beverage)
    }
    
    
}


/*
 0 : 자판기 구조체를 설계하고, 다음과 같은 동작을 위한 메소드를 작성한다.
 0 : 자판기 금액을 원하는 금액만큼 올리는 메소드

 0 : 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드

 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
 음료수를 구매하는 메소드
 잔액을 확인하는 메소드
 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
 0 : 유통기한이 지난 재고만 리턴하는 메소드
 0 : 따뜻한 음료만 리턴하는 메소드
 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
 main에서 음료수 객체 인스턴스를 종류별로 추가하고 자판기 동작을 확인하도록 구현한다.
 자판기 화면을 자기만의 방식으로 메뉴를 표시한다.
 메뉴에서 입력하는 동작을 자판기 함수에 연결한다.
 전체 코드를 확인할 수 있는 통합 테스트 시나리오를 가지고 동작을 확인한다.
 예를 들어서, 재고 몇 개 추가하고 잔액 얼마 추가하면 어떤 상품 구매가능, 불가능인지 확인하고 가능한 상품 구매하고, 잔액 바뀌고 재고 상태 바뀌고, 구매 상품 이력을 확인한다.

 */

/*
VendingMachine 구조체를 생성하여 자판기 기본 동작을 구현했습니다. 내부에서 크게 네 가지 동작으로 나누어 구현하였습니다.
같은 종류의 Beverage 배열을 포함하는 Pack 배열을 통해 음료 재고를 관리하는 Inventory 클래스를 추가했습니다.
balance: Int 프로퍼티로 금액 관련 동작을 구현했습니다.
History 클래스로 음료 구매 이력을 저장했습니다.
출력 관련 클로저를 전달받아 결과를 확인할 수 있도록 구현했습니다.
위에서 구현한 자판기 기능이 제대로 동작하는지 단위테스트를 시행했습니다.
*/
main()
