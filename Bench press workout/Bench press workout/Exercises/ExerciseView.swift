//
//  ExerciseView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import SwiftUI

struct ExerciseView: View {
    @ObservedObject var viewModel = ExerciseViewModel()
    @State var exercise: Exercise = Exercise.exerciseSample
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        GeometryReader { proxy in
            VStack {
                TabView(selection: $viewModel.currentIndex) {
                    ForEach(
                        Array(zip(viewModel.steps.indices, viewModel.steps)),
                        id: \.0
                    ) { index, step in
                        VStack {
                            ExerciseStepView(exerciseName: viewModel.name,
                                             repetitions: viewModel.repetitions,
                                             exerciseImage: viewModel.imageName,
                                             attempt: $viewModel.remainingAttempts,
                                             phase: $viewModel.currentPhase,
                                             inform: $viewModel.stepInform,
                                             advice: $viewModel.stepAdvice,
                                             stepTime: $viewModel.currentTimer,
                                             reminder: $viewModel.remainingAttemptsReminder)
                                .tag(index)
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .tabViewStyle(PageTabViewStyle())
                .onAppear {
                    viewModel.setExerciseProperties(exercise: exercise)
                }
                .onChange(of: viewModel.currentIndex) { newValue in
                    print(newValue)
                }

                Button(action: {
                    viewModel.gotoTheNextStep()
//                    viewModel.updateStepProperties()
//                    viewModel.updatePhaseProperties()
                }, label: {
                    ContinueButtonView(description: $viewModel.buttonDescription)
                        .padding()
                })
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
