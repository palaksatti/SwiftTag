//
//  SectionTitle.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import SwiftUI

struct SectionTitle: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title3.bold())
                .foregroundStyle(AppColors.primaryText)
            Spacer()
        }
        .padding(.horizontal, 4)
    }
}

#Preview {

    SectionTitle(title: "Status")
}
