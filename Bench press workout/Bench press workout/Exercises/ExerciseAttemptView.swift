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

            VStack {
                Text("\(phaseName) **\(attemptMessage)**")
                    .font(.system(size: screenHeight * 0.042))
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .padding(.bottom, screenHeight * 0.08)

                Image(exerciseImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.75)
            }
        }
    }
}
