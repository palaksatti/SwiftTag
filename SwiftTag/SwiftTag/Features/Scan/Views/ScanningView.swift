//
//  ScanningView.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import SwiftUI

struct ScanningView: View {

    @State private var animate = false

    var body: some View {

        VStack(spacing: 24) {

            ZStack {

                Circle()
                    .stroke(AppColors.accent.opacity(0.3), lineWidth: 2)
                    .frame(width: 160,height:160)
                    .scaleEffect(animate ? 1.3 : 0.7)
                    .opacity(animate ? 0 : 1)

                Circle()
                    .fill(AppColors.accent)
                    .frame(width:70,height:70)

                Image(systemName: "antenna.radiowaves.left.and.right")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

            }

            Text("Scanning...")
                .font(.title3)
                .fontWeight(.medium)

        }
        .onAppear {

            withAnimation(
                .easeOut(duration: 1.2)
                .repeatForever(autoreverses: false)
            ) {
                animate = true
            }
        }
    }
}

#Preview {

    ScanningView()
}
