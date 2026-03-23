//
//  RoutineData.swift
//  GymRatRoutineBy5p
//

import Foundation

struct ExerciseDefinition: Identifiable {
    let id: String
    let name: String
    let numberOfSets: Int
}

struct RoutineDefinition: Identifiable {
    let id: String
    let name: String
    let day: String
    let icon: String
    let exercises: [ExerciseDefinition]
}

enum RoutineData {
    static let routines: [RoutineDefinition] = [
        RoutineDefinition(
            id: "leg_quads",
            name: "Leg (Quads)",
            day: "Monday",
            icon: "figure.strengthtraining.traditional",
            exercises: [
                ExerciseDefinition(id: "leg_quads_back_squad", name: "Back Squad", numberOfSets: 4),
                ExerciseDefinition(id: "leg_quads_burbell_lunges", name: "Burbell Lunges", numberOfSets: 3),
                ExerciseDefinition(id: "leg_quads_leg_extension", name: "Leg Extension", numberOfSets: 3),
                ExerciseDefinition(id: "leg_quads_calf_raise_smith", name: "Calf Raise (Smith Machine)", numberOfSets: 4),
                ExerciseDefinition(id: "leg_quads_sissy_squad", name: "Sissy Squad", numberOfSets: 3),
                ExerciseDefinition(id: "leg_quads_box_step_up", name: "Box Step-Up", numberOfSets: 3),
                ExerciseDefinition(id: "leg_quads_lunges_smith", name: "Lunges (Smith Machine)", numberOfSets: 3),
            ]
        ),
        RoutineDefinition(
            id: "pull",
            name: "Pull",
            day: "Wednesday",
            icon: "arrow.down.to.line",
            exercises: [
                ExerciseDefinition(id: "pull_peso_muerto_sumo", name: "Peso Muerto Sumo", numberOfSets: 4),
                ExerciseDefinition(id: "pull_dominadas", name: "Dominadas", numberOfSets: 4),
                ExerciseDefinition(id: "pull_remo_con_barra", name: "Remo con Barra", numberOfSets: 3),
                ExerciseDefinition(id: "pull_facepull", name: "Facepull", numberOfSets: 3),
                ExerciseDefinition(id: "pull_curl_biceps_sentado", name: "Curl Biceps Sentado", numberOfSets: 3),
                ExerciseDefinition(id: "pull_curl_martillo", name: "Curl Martillo", numberOfSets: 3),
            ]
        ),
        RoutineDefinition(
            id: "push",
            name: "Push",
            day: "Thursday",
            icon: "arrow.up.to.line",
            exercises: [
                ExerciseDefinition(id: "push_bench_press", name: "Bench Press", numberOfSets: 4),
                ExerciseDefinition(id: "push_press_inclinado_mancuernas", name: "Press Inclinado Mancuernas", numberOfSets: 3),
                ExerciseDefinition(id: "push_overhead_press", name: "Overhead Press", numberOfSets: 3),
                ExerciseDefinition(id: "push_elevaciones_laterales", name: "Elevaciones Laterales", numberOfSets: 3),
                ExerciseDefinition(id: "push_fondos_paralelas", name: "Fondos en Paralelas", numberOfSets: 3),
                ExerciseDefinition(id: "push_extension_triceps_soga", name: "Extensión de Triceps Soga", numberOfSets: 3),
                ExerciseDefinition(id: "push_triceps_barra_recta", name: "Triceps Barra Recta", numberOfSets: 3),
                ExerciseDefinition(id: "push_overhead_press_machine", name: "Overhead Press Machine", numberOfSets: 3),
            ]
        ),
        RoutineDefinition(
            id: "leg_fem",
            name: "Leg (Fem)",
            day: "Friday",
            icon: "figure.cooldown",
            exercises: [
                ExerciseDefinition(id: "leg_fem_romanian_deadlift", name: "Romanian Deadlift", numberOfSets: 4),
                ExerciseDefinition(id: "leg_fem_hip_thrust", name: "Hip Thrust", numberOfSets: 3),
                ExerciseDefinition(id: "leg_fem_curl_femoral", name: "Curl Femoral", numberOfSets: 3),
                ExerciseDefinition(id: "leg_fem_zancadas_caminando", name: "Zancadas Caminando", numberOfSets: 3),
                ExerciseDefinition(id: "leg_fem_elevacion_gemelos_multipower", name: "Elevación de Gemelos en Multipower", numberOfSets: 4),
                ExerciseDefinition(id: "leg_fem_gluteo_medio_sentado", name: "Glúteo Medio Sentado", numberOfSets: 3),
            ]
        ),
        RoutineDefinition(
            id: "upper",
            name: "Upper",
            day: "Saturday",
            icon: "figure.arms.open",
            exercises: [
                ExerciseDefinition(id: "upper_dominadas", name: "Dominadas", numberOfSets: 3),
                ExerciseDefinition(id: "upper_press_inclinado_barra", name: "Press Inclinado con Barra", numberOfSets: 3),
                ExerciseDefinition(id: "upper_remo_maquina", name: "Remo en Máquina", numberOfSets: 3),
                ExerciseDefinition(id: "upper_elevaciones_laterales", name: "Elevaciones Laterales", numberOfSets: 3),
                ExerciseDefinition(id: "upper_curl_biceps_inclin_manc", name: "Curl Biceps Inclin c/ Manc", numberOfSets: 3),
                ExerciseDefinition(id: "upper_triceps_soga_tras_nuca", name: "Triceps Soga tras Nuca", numberOfSets: 3),
            ]
        ),
    ]
}
