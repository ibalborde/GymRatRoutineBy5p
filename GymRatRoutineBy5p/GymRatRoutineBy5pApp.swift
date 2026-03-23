//
//  GymRatRoutineBy5pApp.swift
//  GymRatRoutineBy5p
//
//  Created by Maximiliano Ibalborde on 23/03/2026.
//

import SwiftUI
import SwiftData

@main
struct GymRatRoutineBy5pApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ExerciseSession.self,
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
