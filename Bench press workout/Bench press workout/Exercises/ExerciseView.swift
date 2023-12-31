//
//  ExerciseView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import SwiftUI

struct ExerciseView: View {
    @ObservedObject var viewModel = ExerciseViewModel()

    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                let screenWidth = proxy.size.width
                let screenHeight = proxy.size.height

                VStack {
                    TabView(selection: $viewModel.currentStep) {
                        ForEach(
                            0..<viewModel.steps.count,
                            id: \.self
                        ) { index in
                            VStack {
                                AppImages.hitLogo
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 110)
                                    .padding(.top, screenHeight * 0.04)
                                    .padding(.bottom, screenHeight * 0.024)

                                Text(viewModel.exerciseName)
                                    .font(.system(size: 32))
                                    .fontWeight(.bold)
                                    .textCase(.uppercase)
                                    .foregroundColor(.white)
                                    .padding(.bottom, screenHeight * 0.016)

                                ExerciseStepView(
                                    attemptMessage: viewModel.getAttemptMessage(stepIndex: index),
                                    exerciseImage: viewModel.exerciseImageName,
                                    phase: viewModel.getExercisePhase(stepIndex: index),
                                    inform: viewModel.getStepInform(stepIndex: index),
                                    advice: viewModel.getStepAdvice(stepIndex: index),
                                    stepTime: viewModel.getStepTotalTime(stepIndex: index),
                                    reminder: viewModel.getRemainingAttemptsMessage(stepIndex: index),
                                    onTimerFinished: {
                                        viewModel.timerFinished()
                                    })
                                .tag(index)
                                .padding(.horizontal, screenWidth * 0.1)

                                if viewModel.getExercisePhase(stepIndex: index) == .rest || viewModel.currentStep == viewModel.steps.count - 1 {
                                    NavigationLink(destination: MeasurementView().navigationBarBackButtonHidden(true)) {
                                        ContinueButtonView(description: viewModel.buttonDescription)
                                    }
                                    .padding()
                                } else {
                                    ContinueButton(
                                        description: $viewModel.buttonDescription,
                                        action: {
                                            viewModel.buttonTapped()
                                        }
                                    )
                                    .padding()
                                }
                            }
                        }
                    }
                    .animation(.easeInOut, value: viewModel.currentStep)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .tabViewStyle(PageTabViewStyle())
                    .onAppear {
                        print(viewModel.currentStep)
                        viewModel.setExerciseProperties()
                    }
                    .onChange(of: viewModel.currentStep) { _ in
                        withAnimation {
                            viewModel.stepChanged()
                        }
                    }
                }
            }
            .background {
                AppImages.stepScreenBg
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .overlay(stepsOverlay)
            }
        }
    }

    var stepsOverlay: some View {
        Rectangle()
            .foregroundColor(AppColors.exerciseBg)
            .opacity(0.9)
            .ignoresSafeArea()
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
