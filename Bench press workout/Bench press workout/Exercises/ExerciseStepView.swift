//
//  ExerciseStepView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import SwiftUI

struct ExerciseStepView: View {
    @State var attemptMessage: String
    @State var exerciseImage: String
    @State var phase: ExercisePhase
    @State var inform: String
    @State var advice: String
    @State var stepTime: Int
    @State var reminder: String
    @State var onTimerFinished: () -> Void

    var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height

            VStack {
                if phase == .warmup {
                    ExerciseWarmupView(
                        name: phase.rawValue,
                        advice: advice,
                        countdownTimer: stepTime,
                        onTimerFinished: onTimerFinished)
                } else if phase == .attempt {
                    ExerciseAttemptView(
                        phaseName: phase.rawValue,
                        attemptMessage: attemptMessage,
                        exerciseImage: exerciseImage)
                } else if phase == .rest {
                    ExerciseRestView(
                        name: phase.rawValue,
                        inform: inform,
                        advice: advice,
                        countdownTimer: stepTime,
                        reminder: reminder,
                        onTimerFinished: onTimerFinished)
                }

                Spacer()
            }
            .frame(width: screenWidth, height: screenHeight)
            .onAppear() {
                printPhase(phase: phase)
            }
        }
    }

    func printPhase(phase: ExercisePhase) {
        print("carregou \(phase)")
    }
}
