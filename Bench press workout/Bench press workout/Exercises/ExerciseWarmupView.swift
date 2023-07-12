//
//  ExerciseWarmupView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import SwiftUI

struct ExerciseWarmupView: View {
    @State var name: String
    @State var advice: String
    @State var stepTime: Int = 0
    @State var countdownTimer: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    @State var onTimerFinished: () -> Void

    var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height

            VStack {
                Text(name)
                    .font(.system(size: screenHeight * 0.042))
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .padding(.bottom, screenHeight * 0.08)

                Text(FormatHandler.time(seconds: countdownTimer))
                    .font(.system(size: screenHeight * 0.1))
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .padding(.bottom)
                    .onReceive(timer) { _ in
                        if countdownTimer > 0 {
                            countdownTimer -= 1
                        } else {
                            onTimerFinished()
                        }
                    }

                Text(advice)
                    .font(.system(size: screenHeight * 0.042))
                    .foregroundColor(.white)
                    .padding(.bottom, screenHeight * 0.08)
            }
            .frame(width: screenWidth)
            .onAppear() {
//                countdownTimer = stepTime
                _ = timer.connect()
            }
            .onDisappear() {
                _ = timer.connect().cancel()
            }
        }
    }
}
