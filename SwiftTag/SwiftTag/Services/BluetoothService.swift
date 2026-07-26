//
//  BluetoothService.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//

import Foundation


protocol BluetoothService {
    func startScanning() async -> [Device]
    func connect(to device: Device) async
    func disconnect(from device: Device) async
}
