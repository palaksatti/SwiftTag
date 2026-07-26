//
//  ActionCard.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import SwiftUI

struct ActionCard: View {

    let icon: String
    let title: String
    let tint: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {

            HStack(spacing: 16) {

                ZStack {

                    Circle()
                        .fill(tint.opacity(0.15))
                        .frame(width: 48, height: 48)

                    Image(systemName: icon)
                        .foregroundStyle(tint)

                }

                Text(title)
                    .font(.headline)
                    .foregroundStyle(AppColors.primaryText)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(AppColors.secondaryText)

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
        .buttonStyle(.plain)
    }
}

#Preview {

    ActionCard(
        icon: "trash",
        title: "Delete Device",
        tint: AppColors.danger
    ) {

    }
}
