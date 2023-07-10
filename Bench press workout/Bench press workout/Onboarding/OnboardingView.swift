//
//  OnboardingView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 08/07/2023.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel = OnboardingViewModel()
//    @State private var orientation = UIDeviceOrientation.unknown
    @State var steps: [OnboardingStep] = OnboardingStep.stepSamples

    var body: some View {
        GeometryReader { proxy in
//            let screenWidth = proxy.size.width
//            let screenHeight = proxy.size.height

            VStack {
                TabView(selection: $viewModel.currentIndex) {
                    ForEach(Array(zip(steps.indices, steps)), id: \.0) { index, step in

                        OnboardingStepView(step: step)
                            .tag(index)

//                        if orientation.isPortrait {
//                            OnboardingStepPortraitView(step: step)
//                                .tag(index)
//                        } else if orientation.isLandscape {
//                            OnboardingStepLandscapeView(step: step)
//                                .tag(index)
//                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .tabViewStyle(PageTabViewStyle())
//                .onRotate { newOrientation in
//                    orientation = newOrientation
//                }

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
