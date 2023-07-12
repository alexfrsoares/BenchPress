//
//  FormatHandler.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import Foundation

struct FormatHandler {
    static func time(seconds: Int) -> String {
        let timeInSeconds = seconds

        let hours = timeInSeconds / 3600
        let minutes = (timeInSeconds % 3600) / 60
        let seconds = (timeInSeconds % 3600) % 60

        if hours == 0 {
            return String(format: "%02d:%02d", minutes, seconds)
        } else {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    }
}
