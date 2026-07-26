//
//  ScanViewModel.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import Foundation
import Observation

@Observable
@MainActor
final class ScanViewModel {

    var nearbyDevices: [Device] = []

    var isScanning = false

    private let repository: DeviceRepository

    init(repository: DeviceRepository) {
        self.repository = repository
    }

    func startScanning() async {

        isScanning = true

        nearbyDevices.removeAll()

        let devices = await repository.scanForNearbyDevices()

        for device in devices {

            try? await Task.sleep(for: .milliseconds(700))

            nearbyDevices.append(device)
        }

        isScanning = false
    }

    func addDevice(_ device: Device) async {

        await repository.addDevice(device)
    }
}
