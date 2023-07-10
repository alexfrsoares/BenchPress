//
//  Exercise.swift
//  Bench press workout
//
//  Created by Alex Freitas on 09/07/2023.
//

import Foundation

struct Exercise {
    var id = UUID()
    var name: String
    var repetitions: Int
    var imageName: String
    var steps: [ExerciseStep] {
        var steps: [ExerciseStep] = []

        steps.append(ExerciseStep.warmupSample)

        for attempt in 1...repetitions {
            steps.append(ExerciseStep.attemptSample)
            if attempt < repetitions {
                steps.append(ExerciseStep.restSample)
            }
        }

        return steps
    }

    static let exerciseSample = Exercise(
        name: "Bench Press (1RM)",
        repetitions: 4,
        imageName: "press2"
    )
}

struct ExerciseStep {
    var id = UUID()
    var phase: ExercisePhase
    var time: Int {
        switch phase {
        case .warmup:
            return 600
        case .attempt:
            return 0
        case .rest:
            return 180
        }
    }
    var inform: String
    var advice: String

    static let warmupSample = ExerciseStep(
        phase: .warmup,
        inform: "",
        advice: "The main goal is to find that perfect middle ground where you're warmed up enough, but still feeling energized and ready to go."
    )

    static let attemptSample = ExerciseStep(
        phase: .attempt,
        inform: "",
        advice: ""
    )

    static let restSample = ExerciseStep(
        phase: .rest,
        inform: "Next attempt will start in",
        advice: "Remember to breathe and rest."
    )
}

enum ExercisePhase: String {
    case warmup = "Warm-up"
    case attempt = "Attempt"
    case rest = "Rest"
}
