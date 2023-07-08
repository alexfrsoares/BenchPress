//
//  OnboardingView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 08/07/2023.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel = OnboardingViewModel()
    @State var onboardingSteps: [OnboardingStep] = OnboardingStep.stepSamples
    var step = OnboardingStep.stepSample

    var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height

            VStack(alignment: .center) {

                Spacer()

                Image(step.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth * 0.7)

                Spacer()

                Group {
                    Text(step.name)
                        .font(.system(size: 26))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    Text(step.description)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .multilineTextAlignment(.center)
                .frame(width: screenWidth * 0.8)

                Spacer()
            }
            .frame(width: screenWidth)
        }
        .background(Color("Green onboarding bg"))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
