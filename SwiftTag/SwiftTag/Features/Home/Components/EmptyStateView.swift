//
//  EmptyStateView.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//

import SwiftUI


struct EmptyStateView: View {

    var body: some View {

        VStack(spacing: 24) {

            Image(systemName: "dot.radiowaves.up.forward")
                .font(.system(size: 72))
                .foregroundStyle(AppColors.accent)

            Text("No Devices Yet")
                .font(.title2.bold())
                .foregroundStyle(AppColors.primaryText)

            Text("Start tracking your valuables by adding your first Bluetooth tracker.")
                .multilineTextAlignment(.center)
                .foregroundStyle(AppColors.secondaryText)
                .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(AppColors.background)
    }
}
#Preview {
    EmptyStateView()
}
