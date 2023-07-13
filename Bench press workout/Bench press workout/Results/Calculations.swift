//
//  Calculations.swift
//  Bench press workout
//
//  Created by Alex Freitas on 13/07/2023.
//

import Foundation

struct Calculations {
    static func oneRM(weight: Double, repetitions: Double) -> Double {
        let oneRM = weight / ((1.0278) - (0.0278 * repetitions))
        return oneRM
    }
}
