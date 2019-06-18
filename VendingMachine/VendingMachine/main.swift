//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let bananaMilk1 = BananaMilk(brand: "빙그레", ml: 200, price: 1300, name: "빙그레 바나나우유", productDate: "20190301")
    let bananaMilk2 = BananaMilk(brand: "빙그레", ml: 200, price: 1300, name: "빙그레 바나나우유", productDate: "20190405")
    let fanta = Fanta(brand: "롯데", ml: 350, price: 2000, name: "오렌지 환타", productDate: "20190505")
    let top = TOP(brand: "맥심", ml: 400, price: 3000, name: "TOP아메리카노", productDate: "20190606")
    
    print(bananaMilk1)
    print(bananaMilk2)
    print(fanta)
    print(top)
}

main()
