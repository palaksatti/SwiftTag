//
//  BatteryView.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//

import SwiftUI

struct BatteryView: View {

    let battery: Int?
    private var batteryIcon: String {

        guard let battery else {
            return "battery.0"
        }

        switch battery {

        case 81...100:
            return "battery.100"

        case 51...80:
            return "battery.75"

        case 21...50:
            return "battery.50"

        default:
            return "battery.25"
        }
    }

    var body: some View {

        HStack(spacing: 5) {

            Image(systemName: batteryIcon)

            Text("\(battery ?? 0)%")
        }
        .font(.caption)
        .fontWeight(.medium)
        .foregroundStyle(AppColors.secondaryText)
    }
}

#Preview {
    BatteryView(battery: 90)
}
