//
//  ExerciseView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import SwiftUI

struct ExerciseView: View {
    @ObservedObject var viewModel = ExerciseViewModel()
    @State var currentPage: Int = 0

    var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height

            VStack {
                TabView(selection: $currentPage) {
                    ForEach(
                        0..<viewModel.steps.count,
                        id: \.self
                    ) { index in
                        VStack {
                            AppImages.hitLogo
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth * 0.3)
                                .padding(.top, screenHeight * 0.04)
                                .padding(.bottom, screenHeight * 0.024)

                            Text(viewModel.exerciseName)
                                .font(.system(size: screenHeight * 0.042))
                                .fontWeight(.bold)
                                .textCase(.uppercase)
                                .foregroundColor(.white)
                                .padding(.bottom, screenHeight * 0.016)
                            
                            ExerciseStepView(attemptMessage: viewModel.getAttemptMessage(stepIndex: index),
                                             exerciseImage: viewModel.exerciseImageName,
                                             phase: viewModel.getExercisePhase(stepIndex: index),
                                             inform: viewModel.getStepInform(stepIndex: index),
                                             advice: viewModel.getStepAdvice(stepIndex: index),
                                             stepTime: viewModel.getStepTotalTime(stepIndex: index),
                                             reminder: viewModel.getRemainingAttemptsMessage(stepIndex: index),
                                             onTimerFinished: {
                                                currentPage = viewModel.buttonTapped(at: currentPage)
                                             })
                                .tag(index)

                            Button(action: {
                                currentPage = viewModel.buttonTapped(at: currentPage)
                            }, label: {
                                ContinueButtonView(description: $viewModel.buttonDescription)
                                    .padding()
                            })
                        }
                    }
                }
                .animation(.easeInOut, value: currentPage)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .tabViewStyle(PageTabViewStyle())
                .onAppear {
                    viewModel.setExerciseProperties()
                }
                .onChange(of: currentPage) { _ in
                    withAnimation {
                        viewModel.stepChanged(to: currentPage)
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
