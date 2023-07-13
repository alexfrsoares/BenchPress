//
//  ResultsTableViewModel.swift
//  Bench press workout
//
//  Created by Alex Freitas on 13/07/2023.
//

import Foundation

extension ResultsTableView {
    @MainActor class ResultsTableViewModel: ObservableObject {
        func getPercentageLabel() -> String {
            return "%"
        }

        func getPercentageValues() -> [String] {
            return ["55", "65", "75", "85", "90", "95"]
        }

        func getWeightLabel() -> String {
            return "KG"
        }

        func getWeightValues() -> [String] {
            return ["118", "140", "162", "183", "194", "205"]
        }

        func getRepetitionLabel() -> String {
            return "Reps"
        }

        func getRepetitionValues() -> [String] {
            return ["19", "13", "7", "4", "3", "2"]
        }
    }
}
