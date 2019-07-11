# Step1 - 음료수 클래스 생성 (1.7.19)

## 구조

- **Product (class):** 제품의 속성(brand, capacityl, price, name, date)을 가지는 클래스
- **Milk (class):** Product를 상속하고, brand를 "서울우유"로 가지는 클래스
- **Soda (class):** Product를 상속하고, brand를 "팹시"로 가지는 클래스
- **Coffee (class):** Product를 상속하고, brand를 "맥심"로 가지는 클래스
- **DateUtil (struct):** date에 대한 데이터를 가지고 있는 구조체
  - **dateFormatter:** "yyyyMMdd"의 포맷을 가지는 상수
  - **convertDate(of text: String) -> Date:** 입력받은 문자열을 Date타입으로 바꿔주는 함수
  - **convertText(of date: Date) -> String:** Date타입을 문자열로 바꿔주는 함수



## 해당 Step을 진행하면서 배운 내용

**클래스:** [오늘의 Swift 상식 (Struct, Class)](https://medium.com/@jgj455/오늘의-swift-상식-struct-class-60fa5fd2218d)

**프로토콜:** [오늘의 Swift 상식 (Protocol)](https://medium.com/@jgj455/오늘의-swift-상식-protocol-f18c82571dad)



## 결과 화면

![Step1_result](/Users/janggukjin/swift-vendingmachine/Assets/Step1_result.png)



## 피드백에 대한 개선 내용

**피드백 받은 사항:** Product타입의 인스턴스를 여러개 만들어서 출력하였다.

**피드백 내용:** 요구사항은 상속을 기본적으로 구현하고 Product를 상속하는 타입들을 가지는 인스턴스를 생성해야한다.

**수정한 내용:** Product를 상속받는 Milk, Soda, Coffee 클래스를 추가하여 이를 가지는 인스턴스들을 생성했다.

# Step2 - 음료수 객체 리팩토링 (8.7.19)

## 추가되거나 삭제된 구조

### 추가된 구조

- **StrawberryMilk (class):** Milk를 상속받고 유통기한을 입력받는 클래스
- **ChocolateMilk (class):** Milk를 상속받고 유통기한을 입력받는 클래스
- **Coke (class):** Soda를 상속받고 칼로리를 입력받는 클래스
- **Sprite (class):** Soda를 상속받고 칼로리를 입력받는 클래스
- **TOPCoffee (class):** Coffee를 상속받고 온도를 입력받는 클래스
- **CantataCoffee (class):** Coffee를 상속받고 온도를 입력받는 클래스



## 해당 Step을 진행하면서 배운 내용

### 단위 테스트(UnitTest)

: 프로그램을 작은 단위(메소드)로 쪼개서 각 단위가 예상대로 정확하게 동작하는지 테스트

- 각 테스트 케이스는 서로 분리되어 있어야한다.

**단위 테스트의 순서**

1. 선행조건을 설정
2. 테스트 조건을 기준으로 코드를 실행
3. 마지막 상태에 대해 assert를 생성
4. assert가 테스트 조건을 만족하는 것이라면 테스트를 통과

**장점**

1. 문제 발생 시 정확하게 어느 부분이 잘못되었는지를 재빨리 확인할 수 있다.
2. 코드의 변경이 쉽다.
3. 통합이 간단하다.



### TDD (Test-Driven Development)

: 테스트코드를 먼저 만들고 이를 통과하는 코드를 만드는 작업을 반복하면서 제대로 동작하는지 테스트하는 개발 방법

- 매우 짧은 개발 사이클을 반복하는 소프트웨어 개발 프로세스
- 검증을 위해서 사용하는 테스트를 가장 앞단계에 배치

**TDD의 순서**

1. 결함을 점검하는 자동화된 테스트 케이스를 작성
2. 케이스를 통과하기 위한 최소한의 양의 코드를 생성
3. 새 코드를 표준에 맞도록 refactoring

**장점**

1. 버그를 줄일 수 있다.
2. 코드의 복잡도가 감소한다.

**단점**

1. 개발 시간이 증가한다.
2. 해당 방법을 적용시키는데 까다로울수있다.

### TDD를 사용하는게 좋은 경우

1. 해당 주제에 대해 처음 프로그래밍 하는 경우
2. 외부적인 불확실성이 높은 경우 (ex. 고객의 요구조건이 바뀔 수 있는 프로젝트)
3. 개발하는 중에 코드를 많이 바꿔야 된다고 판단되는 경우
4. 내가 개발하고 나서 이 코드를 누가 유지보수할지 불확실한 경우

- 불확실성이 높으면 TDD를 하는 것이 낫다.



### TDD와 단위테스트

처음에는 TDD와 단위테스트를 상반된 개념이라 생각했다. 하지만 TDD가 테스트를 위한 방법으로 보면 단위 테스트는 이를 위한 범위와 방법인 것 같다. 궁극적으로 둘다 코드의 에러를 보다 빨리 찾고 유지보수의 편의성을 위해 사용하는 방법들이므로 앞으로의 코드는 테스트를 거치면서 작성해야할것같다.



## 결과 화면

![Step2_result](/Users/janggukjin/swift-vendingmachine/Assets/Step2_result.png)



## 피드백에 대한 개선내용

1.

**피드백 받은 사항:** Coffee클래스의 isHot() 메소드 내부에 비교결과를 if문으로 처리하였다. 

**피드백 내용:** Bool타입을 반환하는 메소드에 조건을 판단하는 로직의 경우 바로 return을 하여야한다.

**수정한 내용:** 조건을 바로 return하도록 수정



2.

**피드백 받은 사항:** 3단계 클래스에 속성을 static let으로 선언

**피드백 내용:** static let으로 선언한 속성의 경우 해당 클래스 타입에만 종속되는 상수 값일뿐더러 인스턴스마다 달라지는 값이 아니다.

**수정한 내용:** private var로 선언하도록 수정



# Step3 - 자판기 기본 동작 (10.7.19)

## 추가되거나 삭제된 구조

### 추가된 구조

- **InputView (Struct):** 안내문구를 출력하고 문구가 적합한지 판단하는 구조체
- **OutputView (Struct):** 결과를 받아 출력하는 구조체
- **VendingMachine (Struct):** 자판기의 기능을 구현한 구조체
- **WorkFlow (Struct):** 입력받은 문구를 받아 자판기를 동작시키는 구조체
- **VendingMachineTest (Unit Test Case Class):** 자판기의 메소드들을 테스트하는 테스트 케이스



## 해당 Step을 진행하면서 배운 내용

VendingMachine 구조체를 생성 후 메소드를 구현하기 전 Test Code를 먼저 작성하여 TDD 방식으로 코딩하였다. 메소드를 구현하기 전 Test Code에서 메소드의 역할과 반환타입을 정하는것이 상당히 어려웠고, 코딩을 하면서 수정도 많이 거쳤다. 하지만 이를 정해놓고 코딩을 하니 객체 별로 의존성이 많이 감소한것 같고, 좀 더 알아보기 쉽고 고치기 쉬운 코드가 된 것 같았다. 앞으로도 이 방식으로 코딩을 하도록 노력해야겠다.



## 결과 화면

![Step3_result](/Users/janggukjin/swift-vendingmachine/Assets/Step3_result.png)



## 피드백에 대한 개선내용

