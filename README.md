# STEP 3

vendingmachine의 기능은 2가지

1. 금액추가

   1 10000	(금액추가명령/추가할 금액)

2. 음료구매 

   2 1  			(음료구매명령/음료수 번호 선택)

Instrcution에 따라 vendingmachine의 상태는

초기상태/대기/판매(가능)/재고부족/잔액부족/금액추가initial/ready/sold/soldout/chargeMoney/notEnoughMoney 의 상태로 변경



자판기 처음 시작시 상태 전이

- InitialState -> ReadyState

금액추가 상태전이

- ReadyState -> 1 -> chargeMoney

금액 추가후 상태 전이

- chargeMoney -> ReadyState

음료구매 상태전이 

- ReadyState -> 2 -> soldState

음료구매시 재고부족 상태전이

- soldState -> outofstock 체크 -> soldoutState

음료구매시 잔액부족 상태전이

- soldState -> balance 체크 -> notEnoughMoney 체크

