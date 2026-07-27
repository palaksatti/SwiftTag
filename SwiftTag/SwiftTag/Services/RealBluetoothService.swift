//
//  RealBluetoothService.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import Foundation
import CoreBluetooth

final class RealBluetoothService: NSObject, BluetoothService {

    private var centralManager: CBCentralManager!
    private var continuation: CheckedContinuation<[Device], Never>?
    private var peripherals: [UUID: CBPeripheral] = [:]
    private var discoveredDevices: [Device] = []

    override init() {
        super.init()

        centralManager = CBCentralManager(
            delegate: self,
            queue: .main
        )
    }


    func startScanning() async -> [Device] {

        await withCheckedContinuation { continuation in
            
            self.continuation = continuation
            
            if centralManager.state == .poweredOn {
                startBLEScan()
            }
        }
    }


    private func startBLEScan() {

        discoveredDevices.removeAll()

        centralManager.scanForPeripherals(
            withServices: nil,
            options: [
                CBCentralManagerScanOptionAllowDuplicatesKey: false
            ]
        )

        Task {
            try? await Task.sleep(for: .seconds(5))

            centralManager.stopScan()

            continuation?.resume(
                returning: discoveredDevices
            )

            continuation = nil
        }
    }


    func connect(to device: Device) async {

        guard let peripheral = peripherals[device.id] else {
            print("Peripheral not found")
            return
        }

        centralManager.connect(peripheral)
    }

    func disconnect(from device: Device) async {

        guard let peripheral = peripherals[device.id] else {
            print("Peripheral not found")
            return
        }

        centralManager.cancelPeripheralConnection(peripheral)
    }
}

extension RealBluetoothService: CBCentralManagerDelegate {
    
    
    func centralManagerDidUpdateState(
        _ central: CBCentralManager
    ) {

        switch central.state {

        case .poweredOn:
            print("Bluetooth ON")

        case .poweredOff:
            print("Bluetooth OFF")

        case .unauthorized:
            print("Bluetooth permission denied")

        default:
            break
        }
    }



    func centralManager(
        _ central: CBCentralManager,
        didDiscover peripheral: CBPeripheral,
        advertisementData: [String : Any],
        rssi RSSI: NSNumber
    ) {

        peripherals[peripheral.identifier] = peripheral


        let device = Device(
            id: peripheral.identifier,
            name: peripheral.name ?? "Unknown Device",
            icon: "dot.radiowaves.left.and.right",
            status: .searching,
            rssi: RSSI.intValue,
            batteryLevel: nil,
            lastSeen: .now
        )


        if !discoveredDevices.contains(where: {
            $0.id == device.id
        }) {

            discoveredDevices.append(device)
        }
    }
}
