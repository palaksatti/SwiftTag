//
//  DetailDeviceViewModel.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import Foundation
import Observation

@Observable
@MainActor
final class DeviceDetailViewModel {

    var device: Device

    private let repository: DeviceRepository

    init(
        device: Device,
        repository: DeviceRepository
    ) {

        self.device = device
        self.repository = repository
    }

    func rename(to name: String) async {

        device.name = name

        await repository.updateDevice(device)
    }

    func connect() async {

        await repository.connect(to: device)
    }

    func disconnect() async {

        await repository.disconnect(from: device)
    }

    func delete() async {

        await repository.deleteDevice(device)
    }
}
