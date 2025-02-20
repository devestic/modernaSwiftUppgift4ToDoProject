//
//  moderna24SwiftDataProjectApp.swift
//  moderna24SwiftDataProject
//
//  Created by Andreas Nygren on 2024-12-03.
//

import SwiftUI
import SwiftData

@main
struct moderna24SwiftDataProjectApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ThingToDo.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
