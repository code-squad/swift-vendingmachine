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
- 기본타입 extension
- CustomStringConvertible 프로토콜 외에 description을 구현하는 방법이 무엇이 있을까?
	- 생각해보고 적용해본 방법 : 상속받는 모든 클래스가 flavor를 가지고 있고 description을 가지고 있다. 하지만 모든 클래스의 flavor타입이 다르므로 이를 상위 클래스에서 제네릭으로 구현해주고 상속받은 하위 클래스에서는 타입만 지정해주면 된다. 이렇게 되면 하위 클래스마다 일일히 해줘야하는 것들을 줄일 수 있다. *하지만* 기존 하위클래스에서 nested type을 사용했던 것을 밖으로 빼주어 구분해줘야 한다.