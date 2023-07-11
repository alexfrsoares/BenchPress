//
//  ExerciseStepView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import SwiftUI

struct ExerciseStepView: View {
    @State var exerciseName: String
    @State var repetitions: Int
    @State var exerciseImage: String
    @Binding var attempt: Int
    @Binding var phase: ExercisePhase
    @Binding var inform: String
    @Binding var advice: String
    @Binding var stepTime: Int
    @Binding var reminder: String

    var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height

            VStack {
                AppImages.hitLogo
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.3)
                    .padding(.top, screenHeight * 0.04)
                    .padding(.bottom, screenHeight * 0.024)

                Text(exerciseName)
                    .font(.system(size: screenHeight * 0.042))
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .padding(.bottom, screenHeight * 0.016)

                if phase == .warmup {
                    ExerciseWarmupView(
                        name: phase.rawValue,
                        advice: advice,
                        countdownTimer: stepTime)
                } else if phase == .attempt {
                    ExerciseAttemptView(
                        name: phase.rawValue,
                        repetitions: repetitions,
                        exerciseImage: exerciseImage,
                        attempt: $attempt)
                } else if phase == .rest {
                    ExerciseRestView(
                        name: phase.rawValue,
                        inform: inform,
                        advice: advice,
                        countdownTimer: stepTime,
                        reminder: $reminder)
                }

                Spacer()
            }
            .frame(width: screenWidth, height: screenHeight)
        }
    }
}

//struct ExerciseStepView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseStepView()
//    }
//}
