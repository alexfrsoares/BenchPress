//
//  OnboardingViewModel.swift
//  Bench press workout
//
//  Created by Alex Freitas on 08/07/2023.
//

import SwiftUI

extension OnboardingView {
    @MainActor class OnboardingViewModel: ObservableObject {
        @Published var currentIndex = 0
        @Published var buttonDescription = "Next"

        func gotoTheNextStep(totalSteps: Int) {
            withAnimation {
                if self.currentIndex == totalSteps - 1 {
                    print("This is the onboarding's end")
                } else {
                    if self.currentIndex == totalSteps - 2 {
                        self.buttonDescription = "Let's Squat"
                    }
                    self.currentIndex += 1
                }
            }
        }
    }
}
