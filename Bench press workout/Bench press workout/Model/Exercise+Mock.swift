//
//  Exercise+Mock.swift
//  Bench press workout
//
//  Created by Alex Freitas on 12/07/2023.
//

import Foundation

extension Exercise {
    static let exerciseSample = Exercise(
        name: "Bench Press (1RM)",
        repetitions: 4,
        imageName: AppImageStrings.benchPressHeavy
    )
}

extension ExerciseStep {
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
