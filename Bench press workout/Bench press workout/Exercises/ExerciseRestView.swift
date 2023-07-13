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
                    .font(.system(size: screenHeight * 0.06))
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .padding(.bottom, screenHeight * 0.16)

                Spacer()

                VStack {
                    Text(inform)
                        .font(.system(size: screenHeight * 0.045))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.bottom, 0)

                    Text(FormatHandler.time(seconds: countdownTimer))
                        .font(.system(size: screenHeight * 0.14))
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
                        .font(.system(size: screenHeight * 0.045))
                        .foregroundColor(.white)

                    Spacer()

                    Text(reminder)
                        .font(.system(size: screenHeight * 0.04))
                        .foregroundColor(.white)
                        .padding(.bottom, 0)
                }
                .onAppear() {
                    _ = timer.connect()
                }
                .onDisappear() {
                    _ = timer.connect().cancel()
                }
            }
            .frame(width: screenWidth, height: screenHeight)
        }
    }
}

struct ExerciseRestView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRestView(
            name: "Rest",
            inform: "Here is your inform.",
            advice: "And your advice is here.",
            countdownTimer: 360,
            reminder: "It reminds you something",
            onTimerFinished: {})
        .background(.black)
    }
}
