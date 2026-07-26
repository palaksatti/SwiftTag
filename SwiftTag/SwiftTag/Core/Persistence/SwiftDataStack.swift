//
//  SwiftDataStack.swift
//  SwiftTag
//
//  Created by Palak Satti on 26/07/26.
//

import Foundation
import SwiftData

@MainActor
final class SwiftDataStack {

    static let shared = SwiftDataStack()

    let container: ModelContainer

    let context: ModelContext

    private init() {

        do {

            container = try ModelContainer(for: Device.self)

            context = ModelContext(container)

        } catch {

            fatalError("Failed to create ModelContainer: \(error)")
        }
    }
}
