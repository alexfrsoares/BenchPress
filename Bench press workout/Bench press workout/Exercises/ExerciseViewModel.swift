//
//  ExerciseViewModel.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import SwiftUI

extension ExerciseView {
    @MainActor class ExerciseViewModel: ObservableObject {
        private var exercise: Exercise = Exercise.exerciseSample

        var exerciseName: String {
            return exercise.name
        }
        var repetitions: Int {
            return exercise.repetitions
        }
        var exerciseImageName: String {
            return exercise.imageName
        }
        var steps: [ExerciseStep] {
            return exercise.steps
        }
        var attemptSteps: [Int: Int] = [:]
        var remainingAttemptsAtStep: [Int: Int] = [:]

        @Published var currentStep = 0
        @Published var buttonDescription = ""

        func setExerciseProperties() {
            setAttemptInformations()
            updateButtonLabel(currentPage: 0)
        }

        func setAttemptInformations() {
            var attemptsCount = 1
            var attemptsCountdown = repetitions - 1

            for index in steps.indices {
                if steps[index].phase == .attempt {
                    attemptSteps[index] = attemptsCount
                    attemptsCount += 1
                    remainingAttemptsAtStep[index + 1] = attemptsCountdown
                    attemptsCountdown -= 1
                }
            }
        }

        func getExercisePhase(stepIndex: Int) -> ExercisePhase {
            return steps[stepIndex].phase
        }

        func getStepTotalTime(stepIndex: Int) -> Int {
            return steps[stepIndex].totalTime
        }

        func getStepInform(stepIndex: Int) -> String {
            return steps[stepIndex].inform
        }

        func getStepAdvice(stepIndex: Int) -> String {
            return steps[stepIndex].advice
        }

        func getAttemptMessage(stepIndex: Int) -> String {
            var message = ""

            if steps[stepIndex].phase == .attempt {
                let attempt = attemptSteps[stepIndex]

                guard let currentAttempt = attempt else { return message }

                if currentAttempt <= repetitions {
                    message = "\(currentAttempt)/\(repetitions)"
                    return message
                }
            }

            return message
        }

        func getRemainingAttemptsMessage(stepIndex: Int) -> String {
            var message = ""

            if steps[stepIndex].phase == .rest {
                let remaining = remainingAttemptsAtStep[stepIndex]

                guard let remaining = remaining else { return message }
                
                if remaining > 0 {
                    message = "You still have \(remaining)/\(repetitions) attempts"
                    return message
                }
            }

            return message
        }

        func buttonTapped(at step: Int) -> Int {
            var move = 0
                if step == steps.count - 1 {
                    move -= step
                    print("This is the exercise's end")
                } else {
                    move = 1
                }

            return step + move
        }

        func timerFinished(step: Int) {

        }

        func stepChanged(to page: Int) {
            updateButtonLabel(currentPage: page)
        }

        func updateButtonLabel(currentPage: Int) {
            let currentPhase = steps[currentPage].phase

            switch currentPhase {
                case .warmup:
                    buttonDescription = "Start testing"
                case .attempt:
                    buttonDescription = "Done"
                case .rest:
                    buttonDescription = "Finish measurement"
            }
        }
    }
}
