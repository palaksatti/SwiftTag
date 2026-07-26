//
//  DeviceRepository.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//

import Foundation

protocol DeviceRepository {

    func getTrackedDevices() async -> [Device]
    func scanForNearbyDevices() async -> [Device]
    func addDevice(_ device: Device) async
    func deleteDevice(_ device: Device) async
    func updateDevice(_ device: Device) async
    func connect(to device: Device) async
    func disconnect(from device: Device) async
}
