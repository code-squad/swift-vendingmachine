## 음료 자판기 

---

<br>

## STEP2

###  음료 클래스 구조

<img width="972" alt="스크린샷 2019-08-14 오전 5 14 25" src="https://user-images.githubusercontent.com/39197978/62974092-643fa880-be52-11e9-896c-d62d03785b15.png">



---

<br>

<br>

<br>

## STEP3



#### 주요 Protocol

- **`Product`**

  ```swift
  protocol Product: class {
      var productName: String { get }
      var productPrice: Money { get }
      var isHot: Bool { get }
      var isDue: Bool { get }
  }
  extension Product {
      var productDescription: String {
          return "\(productName) \(productPrice)"
      }
  }
  ```

  - 기존의 Beverage 데이터중에 자판기가 핸들링해야 하는 데이터가 존재한다.
  - 하지만 그렇다고 기존에 있던 `Beverage`의 데이터의 접근제한자를 수정하기 보다는 타입을 확장(**OCP**)해서 사용하는 게 좋다고 판단하여 공개할 변수들만 사용할 수 있게 하였고, 그걸 `Beverage`가 결정할 수 있게 하였다.

  - `VendingMachine` 은 변화에 덜 취약한 추상적인 Product에 의존하게 하여 **DIP**도 최대한 지키게 하려 하였다.

    <br>

- **`MoneyHandleable , TupleListHandable`**

- ```swift
  protocol MoneyHandleable {
      func handleMoney(_ handler: (Money) -> Void)
  }
  
  protocol TupleListHandleable {
      associatedtype Key
      associatedtype Value
      func handleTupleList(_ handler: ([(Key, Value)]) -> Void)
  }
  ```

  - 내부 데이터를 핸들링 할 수 있는 로직(클로저)를 주입 할 수 있는 인터페이스를 제공하는 프로토콜로 하여 데이터를 가져오는 방식이 아닌 데이터를 처리할 로직을 주입할 수 있게 만들어준다.

  - 데이터를 가져오는 건 OOP에서 권장되지 않을 뿐 아니라, 데이터를 전달하면, 데이터의 양이 클 경우 복사에 따른 비용이 발생하기때문에 **객체 내부에서 자신의 데이터를 직접 처리할 수 있게 일을 시킬 수 있다.** 

    <br>

- **`Statehandable`**

  ```swift
  
  protocol StateHandleable {
      mutating func handle(_ before: State) -> Result<State, Error>
      func complete()
  }
  ```

  - 스트래티지 로서의 역할을 하는 프로토콜이다.

  - 요구사항 분석에서 사용자의 입력에 따른 명령에 따른 **VendingMachine의 행동(메서드)** 계속적으로 추가될 수 있음을 추측했다.

  - 잔돈 : `Balence` / 재고: `Inventory` 를 핸들링하는 행동이 추가될 것이라고 예상했고, 그 행동군을 캡슐화하여 외부에서 주입 할 수 있게 하는 방법을 고려해보았다. 

    <br>

    <br>

    

#### 익스텐션

```swift
//
//  Extensions.swift
//  VendingMachine
//
//  Created by 이동영 on 13/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

func print<T: Beverage>(beverage: T) {
    print("\(type(of: beverage)) - \(beverage.description)")
}
// MARK: - Date Extension
extension Date {
    var text: String {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "yyyyMMdd"
        return dateFormmater.string(from: self)
    }
}
// MARK: - Int Extesion
extension Int {
    var dayDuration: TimeInterval {
        let secOfDay = 86400
        return TimeInterval(self * secOfDay)
    }
}
// MARK: - Array Extension
extension Array where Element == String {
    var dictionary: [String: Int] {
        var statistic = [String: Int]()
        self.forEach { statistic[$0] = (statistic[$0] ?? 0) + 1 }
        return statistic
    }
}
// MARK: - Dictionary Extension
extension Dictionary where Key == String, Value == Int {
    var list: [(String, Int)] {
        return self.sorted(by: <)
    }
}
```

- **처음에 해당 메소드를 사용해야할 객체내부에 정의했으나, 객체의 전체적인 응집도가 떨어졌다.** 
- 그래서 익스텐션을 고려해봤다. 



---

### STEP3 - 피드백 이후 개선

`튜플` 과 `DTO` 의 대해 큰 차이를 느끼지 못했었는데, 마침 그 부분에 대해 어드바이스가 들어왔다.

튜플은 이전 Objective-C 에는 존재하지 않던 스위프트에서 등장한 타입이다.

그 결과 여러 개의 값을 반환하는 게 가능해졌다. 

```
튜플은 좀 느슨한 느낌 + 딱 거기만 사용하도록 제한한 느낌이 있어요
좀더 구체적인 타입이 아닌 것 같아서요  
DTO 용도 타입이라면 튜플 보다 명확할 것 같았어요 
```

라는 피드백이 달렸다.

느슨한 느낌이라는 건 - 아마 응집도가 높지 않다? 각각의 엘리먼트간의 강한 응집도가 아닌 느낌을 말씀하신다는 생각이 들었다.

딱 거기만 사용하도록 제한한 느낌 -  타입이라기 보단 임시로 여러개의 값을 편의상 묶는 느낌이라고 느꼈다.

조금 더 검색해보니 

**튜플은 복잡한 자료를 저장할 때도 적합하지 않으므로, 구조체와 클래스를 정의해야한다.**

**데이터 구조가 이런 임시적인 범위를 넘어서 영구적으로 사용할 필요가 있다면 클래스나 구조체로 정의해야합니다.**

를 보면 튜플은 임시적인 용도로 묶는 느낌이 

------



---



## STEP4

이전 `StateHandleable` 을 스트래티지 패턴으로 구현해두었다.

그래서 추가적인 재고추가 / 재고 삭제 와 같은 자판기의 상태 핸들링에 비교적 쉽게 할 수 있었으나,

스트래티지 행동 자체에 이제 권한이 추가되었다. (관리자 / 사용자). 

<br>이런 식의 추가 기능이 아닌, 각각의 기능에 추가적인 정보(현재의 권한) 를 필요로 하는 경우, 수정이 연쇄적으로 일어나야했다.

현재 프로그램에서 데이터를 한 단계씩 가공해 나간다.

**`input(String)` ➡️ `Request(enum)` ➡️  ` Strategy(StateHandleable)`**

약하지만 결합되이 었는 느낌이 들었다. 

권한이라는 요구사항이 추가되자, `Request` 열거형의 `switch` 문에서, `error` 를 뿜어냈다.

다행히 `strategy`  에 관련된 부분은 영향을 안 받을 수 있었다.

- **`RequestFactory`**

```swift
struct RequestFactory {
    static func create(authority: Authority, input: String) throws -> Request {
        let numbers = input
            .split(separator: " ")
            .map { Int($0) }
        guard
            numbers.count == 2,
            let menu = numbers[0],
            let value = numbers[1],
            value > 0
            else { throw InputError.wrongFormat }
        switch (authority, menu) {
        case (.admin, 1):
            guard
                let product = Category(rawValue: value - 1)?.instance
                else { throw InputError.wrongFormat }
            return .inStock(product: product)
        case (.admin, 2):
            return .deStock(index: value)
        case (.user, 1):
            return .insert(amount: value)
        case (.user, 2):
            return .purchase(index: value)
        default:
            throw InputError.invalidMenu
        }
    }
    
    enum InputError: LocalizedError {
        case wrongFormat
        case invalidMenu
        
        var errorDescription: String? {
            switch self {
            case .wrongFormat:
                return "올바른 포맷이 아닙니다."
            case .invalidMenu:
                return "해당하지 메뉴가 존재하지 않습니다."
            }
        }
    }
}

```

- **`StateHandleableFactory`**

```swift
struct StateHandleableFactory {
    static func create(_ request: Request) -> StateHandleable {
        switch request {
        case .insert(amount: let value):
            let money = Money(value: value)
            return MoneyInsertStrategy(moneyToAdd: money,
                                       completion: OutputView.showInsertMoney)
        case .purchase(index: let value):
            let index = value - 1 
            return PurchaseStrategy(productToPurchaseIndex: index,
                                    completion: OutputView.showPurchase)
        case .inStock(let product):
            return InStockStrategy(stockToAdd: product,
                                   completion: OutputView.showInStock)
        case .deStock(index: let value):
            let index = value - 1 
            return DeStockStrategy(indexOfStockToRemove: index,
                                   completion: OutputView.showDeStock)
        }
    }
}
```



요구사항 변경에 대한 예측이 내가 원하는 대로 되지 않았을 때, 그에 따른 비용은 컸다. 

커맨드 패턴과 스트래티지 패턴 사이에서 마지막에 망설였다.

하지만 커맨드 패턴은 내가 원하는 것에 맞지 않았다. 

나는 `Receiver`에 해당하는 객체를 `VendingMachine `내부에 숨겨두고, `VendingMachine`이 주체적으로 결정하기를 원했다.

---

<br>

## STEP4 - 피드백 및 개선

#### 피드백 #1 🤔

>음료 클래스를 상속해서 만들고 `Category`로 음료 객체 타입을 구분하는 아이디어는 상충합니다.
>왜냐하면 새로운 클래스를 확장하거나 상속 받도록 추가하면 여기 Category enum도 같이 수정해야 하기 때문입니다.
>상속을 선택한 경우에는 **상속한 클래스 타입 자체로 표현하려고 노력해보세요.**
>이렇게 분산되면 수정해야 하는 곳이 늘어나게 됩니다.



- **나의 생각과 고민  💬**



<br>

#### 피드백 #2 🤔

> `inputView.showMenu()` 는 명시적으로 없더라도 `readMenu()` 혹은 `selectMenu()` 등으로
> `fetchInput()`과 합쳐도 됐을 것 같습니다.
> `Authority`는 `inputString`으로 만들고 있는데,` InputView`와 관련성이 어떤 건지 모르겠습니다.
> 왜냐하면 아래서 `InputViewFactory.create(mode)`로 넘기고 있는데,
> 관련된 타입이라면 한꺼번에 처리되는 게 좋을 것 같습니다. **추상화 수준이 다른 것 같아서요.**



- **나의 생각과 고민  💬**

  - 비슷한 로직을 가지는 클래스는 재사용을 하면 좋을 것같다. 

    - 모드선택을 입력받는 ` InputView` 
    - 유저의 주문을 입력받는 ` InputView`
    - 관리자의 명령을 입력받는 `InputView`

  - 재사용 하기에는 서로 추상화레벨이 다르다 

    - 입력받은 값을 핸들링 하는 로직이 달라진다.

    