//
//  BluetoothDevice.swift
//  btscanner
//
//  Created by Antti Tulisalo on 3.4.2020.
//  Copyright © 2020 Antti Tulisalo. All rights reserved.
//

import Foundation
import CoreBluetooth

class BluetoothPeripheral: NSObject, CBPeripheralDelegate {

    let peripheral: CBPeripheral

    var name: String?
    
    init(peripheral: CBPeripheral) {
        self.peripheral = peripheral
        self.name = peripheral.name
        super.init()
        self.peripheral.delegate = self
    }
    
    func peripheralDidUpdateName(_ peripheral: CBPeripheral) {
        self.name = peripheral.name
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {

    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor characteristic: CBCharacteristic, error: Error?) {

    }
            
    func peripheral(_ peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]) {

    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {

    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {

    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {

    }
}
