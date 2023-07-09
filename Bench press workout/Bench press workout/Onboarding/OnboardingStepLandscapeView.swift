//
//  OnboardingStepLandscapeView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 09/07/2023.
//

import SwiftUI

struct OnboardingStepLandscapeView: View {
    var step = OnboardingStep.stepSample

    var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height

            HStack(alignment: .center) {

                Spacer()

                Image(step.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenHeight * 0.6)

                Spacer()

                VStack {
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
                .frame(width: screenWidth * 0.6)

                Spacer()
            }
            .frame(height: screenHeight)
        }
        .background(AppColors.onboardingBg)
    }
}

struct OnboardingStepHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStepLandscapeView()
    }
}
