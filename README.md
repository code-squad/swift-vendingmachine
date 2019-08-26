# Step 12. 자판기

## 📌 12-1. 음료수 클래스

![](./images/class-hierarchy.jpeg)

### Beverage class

- 음료수의 공통 property & `CustomStringConvertible` 준수
- `productName` computed property  = brand 이름 + 특성(있을 경우)
  - 제품 이름은 주로 brand 이름 뒤에 해당 브랜드 내의 카테고리 중 하나이므로 출력시에 사용될 `productName` property 를 지정하여 사용함

### Milk class

내부 enum `Flavor` 로 딸기/초코/바나나 

### Coffee class

내부 enum `Variation` 으로 아메리카노/카푸치노 등을 구분

### Soda class

탄산음료 객체를 나타냄

### Coke class

내부 enum `Variant` 으로 다이어트/제로 콜라 등을 구분

### Fanta class

- 내부 enum `Flavor` 으로 오렌지/포도 맛 등을 구분
- Fanta 는 단일 브랜드, 제조사는 한국코카콜라에서만 제조하므로 type property 로 지정함

### DateConverter class

`DateFormatter` class 사용하여 "yyyyMMdd" 형태로 String <-> Date 간 변환 담당



## 📌 Step 12-2 음료수 객체 리팩토링

### Date & Time 관련 클래스

#### Date 표현하기

- `Date` struct : 특정 시점의 시간 (타임존에 독립적인 시간)
- `DateInterval` struct : date 기간을 표현하는 클래스 - 시작 date ~ 종료 date
- `TimeInterval` typealias : 초단위를 나타냄 ( `Double` type )

#### 캘린더 관련 계산

- DateComponents struct : Date 를 구성하는 요소로 날짜 객체를 만들 수 있
- Calendar struct : Date 관련 계산을 상대적인 단위 및 시간 관련해서 제공하는 유틸리티
- TimeZone struct : 해당 지역의 시간으로 변환 가능하게 해주는 struct

#### 날짜 형식 

- DateFormatter class : Date 객체를 텍스트 표현으로 변환해주는 formatter



### String → Date 변환하기

- Beverage class 생성자에서 String → Date 객체로 변환하기

- DateConverter : 변환을 담당하는 클래스

- 변환하기 구현

  1. Beverage class 내에서 DateConverter 객체를 사용하여 Date 객체 만들기

     Beverage 객체가 두 개의 객체에 의존

  2. Date 를 extend 해서 DateConverter 를 이용하여 String 을 받는 생성자 만들기 ✅

     Beverage → Date / Date → DateConverter   ▶︎ 각 클래스가 다른 한 클래스에만 의존 













