//
//  ScanRow.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import SwiftUI

struct ScanRow: View {

    let device: Device

    var body: some View {

        HStack {

            Image(systemName: device.icon)
                .font(.title2)
                .foregroundStyle(AppColors.accent)
                .frame(width: 40)

            VStack(alignment: .leading) {

                Text(device.name)
                    .font(.headline)

                Text("RSSI \(device.rssi)")
                    .font(.caption)
                    .foregroundStyle(AppColors.secondaryText)
            }

            Spacer()

            SignalStrengthView(rssi: device.rssi)
        }
        .padding(.vertical,8)
    }
}

#Preview {

    ScanRow(
        device: Device(
            id: UUID(),
            name: "Keyboard",
            icon: "keyboard",
            status: .searching,
            rssi: -58,
            batteryLevel: 90,
            lastSeen: .now
        )
    )
}
