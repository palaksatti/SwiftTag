//
//  DefaultDeviceRepository.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//

import Foundation
import SwiftData

@MainActor
final class DefaultDeviceRepository: DeviceRepository {

    private let bluetoothService: BluetoothService

    private let context: ModelContext

    init(
        bluetoothService: BluetoothService,
        context: ModelContext
    ) {
        self.bluetoothService = bluetoothService
        self.context = context
    }

    func getTrackedDevices() async -> [Device] {
        let descriptor = FetchDescriptor<Device>(
            sortBy: [
                SortDescriptor(\.lastSeen, order: .reverse)
            ]
        )
        do {
            return try context.fetch(descriptor)

        } catch {
            print(error)
            return []
        }
    }

    func scanForNearbyDevices() async -> [Device] {
        await bluetoothService.startScanning()
    }

    func addDevice(_ device: Device) async {
        context.insert(device)
        try? context.save()
    }

    func deleteDevice(_ device: Device) async {
        context.delete(device)
        try? context.save()
    }

    func updateDevice(_ device: Device) async {
        try? context.save()
    }

    func connect(to device: Device) async {
        device.deviceStatus = .connected

        try? context.save()

        await bluetoothService.connect(to: device)
    }

    func disconnect(from device: Device) async {

        device.deviceStatus = .disconnected
        try? context.save()
        await bluetoothService.disconnect(from: device)
    }
}
