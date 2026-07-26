//
//  AppContainer.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//

import Foundation
import SwiftData

final class AppContainer {

    static let shared = AppContainer()
    let bluetoothService: BluetoothService
    let repository: DeviceRepository
    
    private init() {

        let bluetooth = MockBluetoothService()
        bluetoothService = bluetooth
        repository = DefaultDeviceRepository(
            bluetoothService: bluetooth,
            context: SwiftDataStack.shared.context
        )
    }
}
