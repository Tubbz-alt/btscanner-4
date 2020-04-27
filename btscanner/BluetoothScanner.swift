//
//  BluetoothScanner.swift
//  btscanner
//
//  Created by Suolapeikko on 31/3/20.
//  Copyright © 2020 Suolapeikko. All rights reserved.
//

import Foundation
import CoreBluetooth

class BluetoothScanner: NSObject, CBCentralManagerDelegate {
    
    var cbManager: CBCentralManager!
    var timer: Timer!
    var peripheralList: [BluetoothPeripheral] = []
    
    // Inteval scanning
    func scanWithInterval(_ interval: Int) {

        print("Starting to scan for Bluetooth peripherals using time interval of \(interval) seconds")
        
        // Define serial dispatch queue
        let scanQueue:DispatchQueue = DispatchQueue(label: "com.suolapeikko.scannerqueue", attributes: [])
        
        // Initiate CBManager with dispatch queue
        cbManager = CBCentralManager(delegate: self, queue: scanQueue)
        
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(interval), target: self, selector: #selector(scan), userInfo: nil, repeats: true)
    }
    
    /// Scan for Bluetooth peripherals
    @objc func scan() {
        
        // Scan for Bluetooth peripherals
        if(cbManager != nil && cbManager.state.rawValue==CBManagerState.poweredOn.rawValue) {
            cbManager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey:
            NSNumber(value: true)])
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        // Implement connect
    }
    
    /// Bluetooth peripheral found
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
                    
        let device = peripheralList.first(where: { $0.peripheral === peripheral })
        
        let isNewDevice = device == nil
        
        if isNewDevice {
            print(advertisementData)
            peripheralList.append(BluetoothPeripheral(peripheral: peripheral))
        }
    }
    
    /// Reacting to bluetooth peripheral manager's state change
    func centralManagerDidUpdateState(_ central: CBCentralManager) {

        if(!(central.state.rawValue == CBManagerState.poweredOn.rawValue)) {
            print("In order to user this tool, Bluetooth must be switched on\n")
            exit(EXIT_FAILURE)
        }
    }
}
