//
//  ExerciseRestView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import SwiftUI

struct ExerciseRestView: View {
    @State var name: String
    @State var inform: String
    @State var advice: String
    @State var stepTime: Int = 0
    @State var countdownTimer: Int
    @State var reminder: String
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

                Spacer()

                VStack {
                    Text(inform)
                        .font(.system(size: screenHeight * 0.03))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.bottom)

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
                        .font(.system(size: screenHeight * 0.03))
                        .foregroundColor(.white)

                    Text(reminder)
                        .font(.system(size: screenHeight * 0.03))
                        .foregroundColor(.white)
                }
                .onAppear() {
//                    countdownTimer = stepTime
                    _ = timer.connect()
                }
                .onDisappear() {
                    _ = timer.connect().cancel()
                }

                Spacer()
            }
            .frame(width: screenWidth)
        }
    }
}
