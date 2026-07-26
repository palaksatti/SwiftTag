//
//  InfoRow.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import SwiftUI

struct InfoRow: View {

    let icon: String
    let title: String
    let value: String

    var body: some View {

        HStack(spacing: 14) {

            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(AppColors.accent)
                .frame(width: 28)

            VStack(alignment: .leading, spacing: 3) {

                Text(title)
                    .font(.caption)
                    .foregroundStyle(AppColors.secondaryText)

                Text(value)
                    .font(.headline)
                    .foregroundStyle(AppColors.primaryText)
            }

            Spacer()
        }
        .padding(.vertical,6)
    }
}

