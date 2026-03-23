//
//  ExerciseSession.swift
//  GymRatRoutineBy5p
//

import Foundation
import SwiftData

@Model
final class ExerciseSession {
    var exerciseID: String
    var routineID: String
    var date: Date
    var sets: [SetData]

    init(exerciseID: String, routineID: String, date: Date = .now, sets: [SetData] = []) {
        self.exerciseID = exerciseID
        self.routineID = routineID
        self.date = date
        self.sets = sets
    }
}
