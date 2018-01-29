## 미션 진행과정 - Daily

- 2018.01.26 - step1 요구사항에 대한 구현 : Beverage클래스와 각 음료 클래스(Milk, Soft Drink…)생성, 상속관계로 구현
- 2018.01.27 - 피드백에 따른 수정 : MyDate 객체 생성
  - `Date`타입을 입력하거나 출력할때마다 `DateFormatter()`객체를 사용해야하고, 매번 같은 문자열 `"yyyyMMdd"`포맷을 사용해야하기때문에 객체로 만들어서 입력은 `String`으로만 입력하면 `Date`가 생성되고 그 포맷에 따라 출력되도록 설계.
- 2018.01.28 - step2 요구사항에 대한 구현 : Attribute 프로토콜 구현, UnitTest코드 추가
    - Attribute 프로토콜 : 음료 객체들이 구현해야할 음료의 특징을 나타내는 함수 추가하고 Beverage가 Attribute를 준수하도록 설계
    - Package enum 추가 - Attibute 프로토콜의 package()함수의 리턴값으로 사용하기위해 enum타입 생성
    - Beverage extension 에 Attribute표시하고 오버라이드하려고했더니 안됨ㅠ 스택오버플로우 참고 https://stackoverflow.com/questions/38213286/overriding-methods-in-swift-extensions
    - 유통기한을 계산해서 valid한 상품인지 아닌지를 판단하기 위해, 음료 구조체에 expiration() 함수를 구현, MFDDate타입인 MyDate 객체 내부에서 '오늘(프로그램 실행일)'의 날짜와 MFDDate비교하는 함수 구현함
