//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation


func main() {
    let vendingMachine: VendingMachine = VendingMachine()
    var mode: Mode
    while true {
        mode = VendingPlay.start()
        VendingPlay.run(by: mode, with: vendingMachine)
    }
}

main()


