//
//  StatusCard.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import SwiftUI

struct StatusCard: View {

    let icon: String
    let title: String
    let value: String

    var body: some View {

        HStack(spacing: 18) {

            ZStack {

                Circle()
                    .fill(AppColors.accent.opacity(0.12))
                    .frame(width: 52, height: 52)

                Image(systemName: icon)
                    .font(.title3)
                    .foregroundStyle(AppColors.accent)

            }

            VStack(alignment: .leading, spacing: 4) {

                Text(title)
                    .font(.caption)
                    .foregroundStyle(AppColors.secondaryText)

                Text(value)
                    .font(.headline)
                    .foregroundStyle(AppColors.primaryText)

            }

            Spacer()

        }
        .padding()
        .background(AppColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay {

            RoundedRectangle(cornerRadius: 18)
                .stroke(AppColors.divider, lineWidth: 1)

        }
        .shadow(
            color: AppColors.shadow,
            radius: 8,
            x: 0,
            y: 4
        )
    }
}

#Preview {

    StatusCard(
        icon: "battery.100",
        title: "Battery",
        value: "92%"
    )
}
