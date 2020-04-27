//
//  main.swift
//  btscanner
//
//  Created by Antti Tulisalo on 31.3.2020.
//  Copyright © 2020 Antti Tulisalo. All rights reserved.
//

import Foundation

let scanner = BluetoothScanner()
let interval = 1

scanner.scanWithInterval(interval)
RunLoop.current.run()
