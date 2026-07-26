//
//  DeviceCardView.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//

import SwiftUI

struct DeviceCard: View {

    let device: Device
    var body: some View {

        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: device.icon)
                    .font(.largeTitle)
                    .foregroundStyle(AppColors.accent)
                Spacer()
                ConnectionStatusView(isConnected: device.deviceStatus == .connected)
            }

            Text(device.name)
                .font(.title3)
                .fontWeight(.bold)

            HStack {

                VStack(alignment: .leading, spacing: 8) {

                    Text("Signal")
                        .font(.caption)
                        .foregroundStyle(AppColors.secondaryText)

                    SignalStrengthView(rssi: device.rssi)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 8) {

                    Text("Battery")
                        .font(.caption)
                        .foregroundStyle(AppColors.secondaryText)

                    BatteryView(battery: device.batteryLevel)
                }
            }

            Divider()

            HStack {

                Image(systemName: "clock")

                Text("Last Seen")

                Spacer()

                Text(device.lastSeen.formatted(date: .omitted,
                                               time: .shortened))
            }
            .font(.caption)
            .foregroundStyle(AppColors.secondaryText)

        }
        .padding(20)
        .background(AppColors.card)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(AppColors.divider, lineWidth: 1)
        )
        .shadow(
            color: AppColors.shadow,
            radius: 12,
            x: 0,
            y: 6
        )
    }
}

#Preview {

    DeviceCard(
        device: Device(
            id: UUID(),
            name: "Keys",
            icon: "key.fill",
            status: .connected,
            rssi: -48,
            batteryLevel: 92,
            lastSeen: .now
        )
    )
}
