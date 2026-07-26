//
//  SwiftTagApp.swift
//  SwiftTag
//
//  Created by Palak Satti on 24/07/26.
//

import SwiftUI
import SwiftData

@main
struct SwiftTagApp: App {

    var body: some Scene {
        WindowGroup {
            HomeView()
                .tint(AppColors.accent)
        }
        .modelContainer(for: Device.self)
        
    }
}
