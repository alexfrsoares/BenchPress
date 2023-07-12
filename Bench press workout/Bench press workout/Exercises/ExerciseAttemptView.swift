//
//  ExerciseAttemptView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import SwiftUI

struct ExerciseAttemptView: View {
    @State var phaseName: String
    @State var attemptMessage: String
    @State var exerciseImage: String

    var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height

            VStack(alignment: .center) {
                Text("\(phaseName) **\(attemptMessage)**")
                    .font(.system(size: screenHeight * 0.06))
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .padding(.bottom, screenHeight * 0.08)

                Image(exerciseImage)
                    .resizable()
                    .scaledToFit()

                Spacer()
            }
            .frame(width: screenWidth, height: screenHeight)
        }
    }
}

struct ExerciseAttemptView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseAttemptView(
            phaseName: "Attempt",
            attemptMessage: "7/10",
            exerciseImage: "press")
        .background(.gray)
    }
}
