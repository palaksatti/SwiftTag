//
//  MockBluetoothService.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//

import Foundation

final class MockBluetoothService: BluetoothService {
    
    func startScanning() async -> [Device] {
        
        try? await Task.sleep(for: .seconds(2))
        
        return [

            Device(
                id: UUID(),
                name: "AirPods Pro",
                icon: "airpodspro",
                status: .searching,
                rssi: -44,
                batteryLevel: 82,
                lastSeen: .now
            ),

            Device(
                id: UUID(),
                name: "MacBook Pro",
                icon: "laptopcomputer",
                status: .searching,
                rssi: -60,
                batteryLevel: 75,
                lastSeen: .now
            ),

            Device(
                id: UUID(),
                name: "Keyboard",
                icon: "keyboard",
                status: .searching,
                rssi: -68,
                batteryLevel: 95,
                lastSeen: .now
            ),

            Device(
                id: UUID(),
                name: "Backpack Tag",
                icon: "backpack",
                status: .searching,
                rssi: -52,
                batteryLevel: 90,
                lastSeen: .now
            )
        ]
    }
    
    func connect(to device: Device) async {
        
    }
    
    func disconnect(from device: Device) async {
        
    }
}
