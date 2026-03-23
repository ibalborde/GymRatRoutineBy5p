//
//  ExerciseRowView.swift
//  GymRatRoutineBy5p
//

import SwiftUI

struct ExerciseRowView: View {
    let exercise: ExerciseDefinition
    let hasCurrentData: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(exercise.name)
                    .font(.body)
                Text("\(exercise.numberOfSets) sets")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            if hasCurrentData {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
            }
        }
        .padding(.vertical, 2)
    }
}
