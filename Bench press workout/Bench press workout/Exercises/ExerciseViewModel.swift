//
//  ExerciseViewModel.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import SwiftUI

extension ExerciseView {
    @MainActor class ExerciseViewModel: ObservableObject {
        @Published var currentIndex = 0

        func gotoTheNextStep(totalSteps: Int) {
            withAnimation {
                if self.currentIndex == totalSteps - 1 {
                    print("This is the onboarding's end")
                } else {
                    if self.currentIndex == totalSteps - 2 {
//                        self.buttonDescription = "Let's Squat"
                    }
                    self.currentIndex += 1
                }
            }
        }
    }
}
