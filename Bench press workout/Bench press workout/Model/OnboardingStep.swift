//
//  OnboardingStep.swift
//  Bench press workout
//
//  Created by Alex Freitas on 08/07/2023.
//

import Foundation

struct OnboardingStep: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String

    static let stepSample = OnboardingStep(
        name: "Warm-up properly",
        description: "with a few steps of lighter weights to prepare your muscles and joints for the heavier load.",
        imageName: "press"
    )

    static let stepSamples = [
        OnboardingStep(
            name: "Warm-up properly",
            description: "with a few steps of lighter weights to prepare your muscles and joints for the heavier load.",
            imageName: "press"),
        OnboardingStep(
            name: "Gradually increase",
            description: "the weight and decrease the reps until you reach your testing weight.",
            imageName: "press2"),
        OnboardingStep(
            name: "Form",
            description: "Set up your position by lying flat on the bench, positioning your hands slightly wider than shoulder-width apart on the bar.",
            imageName: "press2"),
        OnboardingStep(
            name: "Execution",
            description: "Perform the exercise by bringing the bar down slowly to your chest, pausing briefly, and then pushing the bar back up to the starting position.",
            imageName: "press2"),
        OnboardingStep(
            name: "Assistance",
            description: "It may be helpful to have a trained spotter or coach present to provide guidance and support during the test.",
            imageName: "press3")
    ]
}
