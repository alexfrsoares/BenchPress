//
//  ResultsViewModel.swift
//  Bench press workout
//
//  Created by Alex Freitas on 13/07/2023.
//

import Foundation

extension ResultsView {
    @MainActor class ResultsViewModel: ObservableObject {
        func getUser1RM(weight: Double, repetitions: Double) -> String {
            let oneRM = weight / ((1.0278) - (0.0278 * repetitions))

            if Int(oneRM) == 0 {
                return "*"
            }
            
            return String(Int(oneRM))
        }
    }
}
