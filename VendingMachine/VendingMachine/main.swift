//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let bananaMilk1 = BananaMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190301")
    let bananaMilk2 = BananaMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190405")
    let fanta = Fanta(brand: "롯데", ml: 350, price: 2000, productDate: "20190505")
    let top = TOP(brand: "맥심", ml: 400, price: 3000, productDate: "20190606")
    
    print(bananaMilk1)
    print(bananaMilk2)
    print(fanta)
    print(top)
}

main()
