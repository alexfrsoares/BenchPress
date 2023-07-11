//
//  ExerciseViewModel.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import SwiftUI

extension Notification.Name {
    static let startStepTimer = Notification.Name.init("StartStepTimer")
}

extension ExerciseView {
    @MainActor class ExerciseViewModel: ObservableObject {
        var name = ""
        var repetitions = 0
        var imageName = ""
        var steps: [ExerciseStep] = []

        @Published var currentIndex = 0
        @Published var currentPhase: ExercisePhase = .warmup
        @Published var stepInform = ""
        @Published var stepAdvice = ""
        @Published var remainingAttempts = 0
        @Published var buttonDescription = ""
        @Published var remainingAttemptsReminder = ""
        @Published var currentTimer = 0

        func setExerciseProperties(exercise: Exercise) {
            self.name = exercise.name
            self.repetitions = exercise.repetitions
            self.imageName = exercise.imageName
            self.steps = exercise.steps

            self.remainingAttempts = repetitions
            self.updateStepProperties()
            self.updatePhaseProperties()
        }

        func gotoTheNextStep() {
            withAnimation {
                if self.currentIndex == self.steps.count - 1 {
                    print("This is the exercise's end")
                } else {
                    self.currentIndex += 1
                    // updating before animation
                    self.updateStepProperties()
                    self.updatePhaseProperties()
                }
            }
        }

        func updateStepProperties() {
            self.currentTimer = steps[currentIndex].time
            self.stepInform = steps[currentIndex].inform
            self.stepAdvice = steps[currentIndex].advice
        }

        func updatePhaseProperties() {
            self.currentPhase = steps[currentIndex].phase

            switch currentPhase {
                case .warmup:
                    self.buttonDescription = "Start testing"
                case .attempt:
                    self.buttonDescription = "Done"
                case .rest:
                    self.buttonDescription = "Finish measurement"
                    if self.remainingAttempts > 0 {
                        self.remainingAttempts -= 1
                        self.updateRemainingAttemptsReminder()
                    }
            }
        }

        func updateRemainingAttemptsReminder() {
            self.remainingAttemptsReminder = "You still have \(remainingAttempts)/\(repetitions) attempts"
        }
    }
}
