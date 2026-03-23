//
//  ExerciseDetailView.swift
//  GymRatRoutineBy5p
//

import SwiftUI
import SwiftData

struct ExerciseDetailView: View {
    let exercise: ExerciseDefinition
    let routine: RoutineDefinition

    @Environment(\.modelContext) private var modelContext
    @State private var editableSets: [SetData]
    @State private var showingSaveConfirmation = false

    // Fetch the saved session for this specific exercise
    @Query private var sessions: [ExerciseSession]

    init(exercise: ExerciseDefinition, routine: RoutineDefinition) {
        self.exercise = exercise
        self.routine = routine
        // Always start with blank sets — no dependency on @Query at init time
        _editableSets = State(initialValue: (0..<exercise.numberOfSets).map { _ in SetData() })
        let exerciseID = exercise.id
        let routineID = routine.id
        _sessions = Query(
            filter: #Predicate<ExerciseSession> {
                $0.exerciseID == exerciseID && $0.routineID == routineID
            }
        )
    }

    private var lastSession: ExerciseSession? { sessions.first }

    var body: some View {
        List {
            // SECTION 1: Last Session (read-only)
            Section("Última Sesión") {
                if let last = lastSession, !last.sets.isEmpty {
                    ForEach(Array(last.sets.enumerated()), id: \.offset) { index, setData in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text("Serie \(index + 1)")
                                    .font(.subheadline.bold())
                                Spacer()
                                Text("\(setData.weight) kg  ×  \(setData.reps) reps")
                                    .foregroundStyle(.secondary)
                            }
                            if !setData.notes.isEmpty {
                                Text(setData.notes)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding(.vertical, 2)
                    }
                } else {
                    Text("Sin datos previos")
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                }
            }

            // SECTION 2: Current Session (editable)
            Section("Sesión Actual") {
                ForEach(editableSets.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Serie \(index + 1)")
                            .font(.subheadline.bold())
                        HStack(spacing: 8) {
                            TextField("Peso (kg)", text: $editableSets[index].weight)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(.roundedBorder)
                            TextField("Reps", value: $editableSets[index].reps, format: .number)
                                .keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 80)
                        }
                        TextField("Notas (opcional)", text: $editableSets[index].notes)
                            .textFieldStyle(.roundedBorder)
                            .font(.subheadline)
                    }
                    .padding(.vertical, 4)
                }
            }

            // SAVE BUTTON
            Section {
                Button(action: saveExercise) {
                    HStack {
                        Spacer()
                        Text("Guardar Ejercicio")
                            .font(.headline)
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.inline)
        .alert("Ejercicio Guardado", isPresented: $showingSaveConfirmation) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Los datos de \(exercise.name) fueron guardados.")
        }
    }

    private func saveExercise() {
        if let existing = lastSession {
            existing.sets = editableSets
            existing.date = .now
        } else {
            let session = ExerciseSession(
                exerciseID: exercise.id,
                routineID: routine.id,
                date: .now,
                sets: editableSets
            )
            modelContext.insert(session)
        }
        try? modelContext.save()
        showingSaveConfirmation = true
    }
}

#Preview {
    let exercise = RoutineData.routines[0].exercises[0]
    let routine = RoutineData.routines[0]
    NavigationStack {
        ExerciseDetailView(exercise: exercise, routine: routine)
    }
    .modelContainer(for: ExerciseSession.self, inMemory: true)
}
