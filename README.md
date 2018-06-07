# VendingMachine 

## Step1 keyword
- 프로토콜
- CustomStringConvertible 프로토콜
- 클래스 상속
- override
- Date class, DataFormatter
- protocol의 associated type과 제네릭 활용
	- [참고링크1](http://minsone.github.io/programming/swift4-grouping-with-protocol-extension)
	- [참고링크2](https://outofbedlam.github.io/swift/2016/04/01/TypeVariable/)
- [Generic Protocols with Associated Type](https://blog.bobthedeveloper.io/generic-protocols-with-associated-type-7e2b6e079ee2)
- 기본타입 extension
- CustomStringConvertible 프로토콜 외에 description을 구현하는 방법이 무엇이 있을까?
	- NSObject를 상속받아서 description을 override하기
		- 만약에 하위 클래스에서 상속받은 상위클래스가 NSObject의 하위클래스라면 CustomStringConvertible 프토로콜을 적용해줄 필요 없이 description만 override하면 된다.
	- 생각해보고 적용해본 방법 : 상속받는 모든 클래스가 flavor를 가지고 있고 description을 가지고 있다. 하지만 모든 클래스의 flavor타입이 다르므로 이를 상위 클래스에서 제네릭으로 구현해주고 상속받은 하위 클래스에서는 타입만 지정해주면 된다. 이렇게 되면 하위 클래스마다 일일히 해줘야하는 것들을 줄일 수 있다. *하지만* 기존 하위클래스에서 nested type을 사용했던 것을 밖으로 빼주어 구분해줘야 한다.

## Step2 keyword
- TimeInterval은 Double의 typealias
- 하위의 공통 인터페이스를 상위 클래스에서 구현하기. -> 하위클래스의 중복코드를 줄일 수 있다.
- __단순한 코드를 구현하려면 요구사항을 만족하는 "최소한의 클래스, 메소드, 중복을 없애는 것"이 중요하다.__
- 단위테스트
	- Right - BICEP
	- Right - 결과가 올바른가? right?
	- B - 모든 경계(boundary) 조건이 CORRECT한가?
	- I - 역(inverse) 관계를 확인할 수 있나?
	- C - 다른 수단을 사용해서 결과를 교차 확인(cross-check)할 수 있나? E - 에러 조건(error condition)을 강제로 만들수 있나?
	- P - 성능(performance) 특성이 한도내에 있나?
- TDD
	- 참고 : 피드백강의자료, 제1회 마스터즈 세미나 - '나는 왜 TDD에 집착하는가(by.포비), [단위테스트와 TDD](https://medium.com/@sryu99/%EB%8B%A8%EC%9C%84-%ED%85%8C%EC%8A%A4%ED%8A%B8-tdd-bdd%EC%9D%98-%EC%B0%A8%EC%9D%B4%EC%A0%90-3d25fab5ccb2), "빠르게!"
		- 테스트 코드를 작성한다.
		- 작성한 테스트 코드와 기존에 작성된 다른 테스트들을 수행한다.
		- 이 시점에서 새로 추가된 테스트 코드는 실패할 것이다.
		- 만일 실패하지 않는다면 올바른 것을 테스트하고 있지 않은 것이므로 그 안에 버그가 있는 것이다.
		- 실패한 테스트를 성공시키기 위한 최소한의 코드를 구현부에 작성한다.
		- 실패한 테스트가 성공하는지 확인하기 위해 테스트를 재수행한다.
		- 필요에 따라 작성한 코드를 리펙토링한다.
		- 다시 처음부터 반복