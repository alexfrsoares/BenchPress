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
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                TabView(selection: $viewModel.currentIndex) {
                    ForEach(
                        Array(zip(exercise.steps.indices, exercise.steps)),
                        id: \.0
                    ) { index, step in
                        VStack {
                            Text("STEP \(index)")
                            Text(exercise.name)
                            Text(step.phase.rawValue)
                            if step.phase == .warmup {
                                Text("TIMER HERE")
                            } else if step.phase == .attempt {
                                Image(exercise.imageName)
                            } else if step.phase == . rest {
                                Text("TIMER HERE")
                            }
                        }
                    }
                }

                Button(action: {
                    viewModel.gotoTheNextStep(totalSteps: exercise.steps.count)
                }, label: {
                    Text("BUTTON NEXT")
                })
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
