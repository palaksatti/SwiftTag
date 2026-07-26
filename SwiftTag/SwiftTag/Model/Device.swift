//
//  Device.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//
import Foundation
import SwiftData

@Model
final class Device {

    @Attribute(.unique)
    var id: UUID
    var name: String
    var icon: String
    var status: DeviceStatus.RawValue
    var rssi: Int
    var batteryLevel: Int?
    var lastSeen: Date

    init(
        id: UUID = UUID(),
        name: String,
        icon: String,
        status: DeviceStatus,
        rssi: Int,
        batteryLevel: Int?,
        lastSeen: Date
    ) {
        self.id = id
        self.name = name
        self.icon = icon
        self.status = status.rawValue
        self.rssi = rssi
        self.batteryLevel = batteryLevel
        self.lastSeen = lastSeen
    }

    var deviceStatus: DeviceStatus {
        get {
            DeviceStatus(rawValue: status) ?? .disconnected
        }
        set {
            status = newValue.rawValue
        }
    }
}
