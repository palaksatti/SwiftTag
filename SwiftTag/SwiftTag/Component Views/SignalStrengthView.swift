//
//  SignalStrengthView.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//

import SwiftUI

struct SignalStrengthView: View {

    let rssi: Int
    private var bars: Int {

        switch rssi {

        case -50...0:
            return 5

        case -60..<(-50):
            return 4

        case -70..<(-60):
            return 3

        case -80..<(-70):
            return 2

        default:
            return 1
        }
    }

    var body: some View {
        HStack(alignment: .bottom, spacing: 3) {

            ForEach(1...5,id:\.self) { index in

                RoundedRectangle(cornerRadius: 2)
                    .fill(
                        index <= bars
                        ? AppColors.accent
                        : AppColors.divider
                    )
                    .frame(width: 5,
                           height: CGFloat(index * 6))
            }
        }
    }
}

#Preview {
    SignalStrengthView(rssi: -52)
}

