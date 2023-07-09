//
//  OnboardingView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 08/07/2023.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel = OnboardingViewModel()
    @State var steps: [OnboardingStep] = OnboardingStep.stepSamples

    var body: some View {
        GeometryReader { proxy in
            VStack {
                TabView(selection: $viewModel.currentIndex) {
                    ForEach(Array(zip(steps.indices, steps)), id: \.0) { index, step in

                        OnboardingStepPortraitView(step: step)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .tabViewStyle(PageTabViewStyle())

                Button(action: {
                    viewModel.gotoTheNextStep(totalSteps: steps.count)
                }, label: {
                    ContinueButtonView(description: $viewModel.buttonDescription)
                        .padding()
                })
            }
        }
        .background(AppColors.onboardingBg)
    }
}
