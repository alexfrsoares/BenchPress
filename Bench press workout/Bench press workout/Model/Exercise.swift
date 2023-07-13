//
//  Exercise.swift
//  Bench press workout
//
//  Created by Alex Freitas on 09/07/2023.
//

import Foundation

struct Exercise {
    let id = UUID()
    let name: String
    let repetitions: Int
    let imageName: String

    lazy var steps: [ExerciseStep] = {
        var steps: [ExerciseStep] = []

        steps.append(ExerciseStep.warmupSample)

        for attempt in 1...repetitions {
            steps.append(ExerciseStep.attemptSample)
            if attempt < repetitions {
                steps.append(ExerciseStep.restSample)
            }
        }

        return steps
    }()
}

struct ExerciseStep {
    let id = UUID()
    let phase: ExercisePhase
    let inform: String
    let advice: String

    var totalTime: Int {
        switch phase {
        case .warmup:
            return 5
        case .attempt:
            return 0
        case .rest:
            return 5
        }
    }
}

enum ExercisePhase: String {
    case warmup = "Warm-up"
    case attempt = "Attempt"
    case rest = "Rest"
}
