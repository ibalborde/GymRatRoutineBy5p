//
//  ContentView.swift
//  GymRatRoutineBy5p
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExerciseSession.self, inMemory: true)
}
