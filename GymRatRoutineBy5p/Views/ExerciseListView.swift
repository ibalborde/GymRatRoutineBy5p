//
//  ExerciseListView.swift
//  GymRatRoutineBy5p
//

import SwiftUI
import SwiftData

struct ExerciseListView: View {
    let routine: RoutineDefinition

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var showingFinishConfirmation = false

    // Fetch all saved sessions for this routine
    @Query private var sessions: [ExerciseSession]

    init(routine: RoutineDefinition) {
        self.routine = routine
        let routineID = routine.id
        _sessions = Query(
            filter: #Predicate<ExerciseSession> { $0.routineID == routineID }
        )
    }

    var body: some View {
        List {
            ForEach(routine.exercises) { exercise in
                NavigationLink(value: AppRoute.exerciseDetail(routineID: routine.id, exerciseID: exercise.id)) {
                    ExerciseRowView(
                        exercise: exercise,
                        hasCurrentData: sessions.contains { $0.exerciseID == exercise.id }
                    )
                }
            }

            Section {
                Button(action: finishRoutine) {
                    HStack {
                        Spacer()
                        Label("Finalizar Rutina", systemImage: "checkmark.seal.fill")
                            .font(.headline)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.vertical, 6)
                }
                .listRowBackground(Color.green)
            }
        }
        .navigationTitle(routine.name)
        .navigationBarTitleDisplayMode(.large)
        .alert("Rutina Guardada", isPresented: $showingFinishConfirmation) {
            Button("OK") { dismiss() }
        } message: {
            Text("Los datos de \(routine.name) fueron guardados correctamente.")
        }
    }

    // MARK: - Finish Routine

    private func finishRoutine() {
        // Sessions are already persisted individually via "Guardar Ejercicio"
        // This button just confirms the routine is done and goes back
        try? modelContext.save()
        showingFinishConfirmation = true
    }
}
