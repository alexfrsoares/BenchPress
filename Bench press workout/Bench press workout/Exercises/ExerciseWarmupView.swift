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
    @State var countdownTimer: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    @State var onTimerFinished: () -> Void

    var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height

            VStack(alignment: .center) {
                Text(name)
                    .font(.system(size: 32))
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .padding(.bottom, screenHeight * 0.16)

                Text(FormatHandler.time(seconds: countdownTimer))
                    .font(.system(size: 80))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 0)
                    .onReceive(timer) { _ in
                        if countdownTimer > 0 {
                            countdownTimer -= 1
                        } else {
                            onTimerFinished()
                        }
                    }

                Text(advice)
                    .font(.system(size: 22))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)

                Spacer()
            }
            .frame(width: screenWidth, height: screenHeight)
            .onAppear() {
                _ = timer.connect()
            }
            .onDisappear() {
                _ = timer.connect().cancel()
            }
        }
    }
}

struct ExerciseWarmupView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseWarmupView(
            name: "Warm-up",
            advice: "Your advice here",
            countdownTimer: 3599,
            onTimerFinished: {})
        .background(.gray)
    }
}
