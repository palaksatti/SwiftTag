//
//  HomeViewModel.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//

import Foundation
import Observation

@Observable
final class HomeViewModel {
    
    var devices: [Device] = []
    
    var isLoading = false
    
    private let repository: DeviceRepository
    
    init(repository: DeviceRepository) {
        self.repository = repository
    }
    func loadDevices() async {

        await refresh()
    }
    
    func refresh() async {

        devices = await repository.getTrackedDevices()
    }
    
    func delete(_ device: Device) async {

        await repository.deleteDevice(device)

        await refresh()
    }
}
