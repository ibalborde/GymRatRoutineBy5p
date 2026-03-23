//
//  HomeView.swift
//  GymRatRoutineBy5p
//

import SwiftUI
import SwiftData

enum AppRoute: Hashable {
    case exerciseList(routineID: String)
    case exerciseDetail(routineID: String, exerciseID: String)
}

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(RoutineData.routines) { routine in
                    NavigationLink(value: AppRoute.exerciseList(routineID: routine.id)) {
                        HStack(spacing: 16) {
                            Image(systemName: routine.icon)
                                .font(.title2)
                                .foregroundStyle(.blue)
                                .frame(width: 36)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(routine.name)
                                    .font(.headline)
                                Text(routine.day)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding(.vertical, 6)
                    }
                }
            }
            .navigationTitle("GymRat Routine")
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .exerciseList(let routineID):
                    if let routine = RoutineData.routines.first(where: { $0.id == routineID }) {
                        ExerciseListView(routine: routine)
                    }
                case .exerciseDetail(let routineID, let exerciseID):
                    if let routine = RoutineData.routines.first(where: { $0.id == routineID }),
                       let exercise = routine.exercises.first(where: { $0.id == exerciseID }) {
                        ExerciseDetailView(exercise: exercise, routine: routine)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: ExerciseSession.self, inMemory: true)
}
