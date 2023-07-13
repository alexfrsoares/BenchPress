//
//  OnboardingView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 08/07/2023.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel = OnboardingViewModel()
    @State var steps: [OnboardingStep] = OnboardingStep.stepSamples

    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $viewModel.currentIndex) {
                    ForEach(Array(zip(steps.indices, steps)), id: \.0) { index, step in
                        OnboardingStepView(step: step)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .tabViewStyle(PageTabViewStyle())

                if viewModel.currentIndex == steps.count - 1 {
                    NavigationLink(destination: ExerciseView()) {
                        ContinueButtonView(description: "Let's squat")
                    }
                    .padding()
                } else {
                    ContinueButton(
                        description: $viewModel.buttonDescription,
                        action: {
                            viewModel.gotoTheNextStep(totalSteps: steps.count)
                        }
                    )
                    .padding()
                }
            }
            .background(AppColors.onboardingBg)
        }
    }
}
