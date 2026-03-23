//
//  SetData.swift
//  GymRatRoutineBy5p
//

import Foundation

struct SetData: Codable, Equatable {
    var weight: String  // e.g. "80.5" or "Sp" for bodyweight
    var reps: Int
    var notes: String

    init(weight: String = "", reps: Int = 0, notes: String = "") {
        self.weight = weight
        self.reps = reps
        self.notes = notes
    }
}
