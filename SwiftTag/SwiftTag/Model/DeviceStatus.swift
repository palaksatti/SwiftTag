//
//  DeviceStatus.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import Foundation

enum DeviceStatus: String, Codable {
    case connected
    case disconnected
    case connecting
    case searching
}
