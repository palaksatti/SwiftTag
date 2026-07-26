//
//  ConnectionStatusView.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//
import SwiftUI

struct ConnectionStatusView: View {
    let isConnected: Bool
    var body: some View {

        HStack(spacing: 6) {

            Circle()
                .fill(isConnected ? AppColors.success : AppColors.danger)
                .frame(width: 8, height: 8)

            Text(isConnected ? "Connected" : "Offline")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(AppColors.primaryText)

        }
        .padding(.horizontal, 12)
        .padding(.vertical, 7)
        .background(
            Capsule()
                .fill(
                    isConnected
                    ? AppColors.success.opacity(0.15)
                    : AppColors.danger.opacity(0.15)
                )
        )
    }
}

#Preview {
    VStack {
        ConnectionStatusView(isConnected: true)
        ConnectionStatusView(isConnected: false)
    }
}
