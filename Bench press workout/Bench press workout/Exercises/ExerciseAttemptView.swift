//
//  ExerciseAttemptView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import SwiftUI

struct ExerciseAttemptView: View {
    @State var name: String
    @State var repetitions: Int
    @State var exerciseImage: String
    @Binding var attempt: Int

    var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height

            VStack {
                Text("\(name) **\(attempt)/\(repetitions)**")
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

struct ExerciseAttemptView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseAttemptView(name: "ATTEMPT", repetitions: 4, exerciseImage: AppImageStrings.benchPressHeavy, attempt: .constant(3))
            .background(AppColors.exerciseBg)
    }
}
