//
//  FormatHandler.swift
//  Bench press workout
//
//  Created by Alex Freitas on 10/07/2023.
//

import Foundation

struct FormatHandler {
    static func date(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        return formatter.string(from: date)
    }

    static func time(seconds: Int) -> String {
        let timeInSeconds = seconds

        let hours = timeInSeconds / 3600
        let minutes = (timeInSeconds % 3600) / 60
        // let seconds = (inSeconds % 3600) % 60

        if hours == 0 && minutes == 0 {
            return "\(minutes)min"
        } else if hours == 0 {
            return "\(minutes)min"
        } else if minutes == 0 {
            return "\(hours)h"
        } else {
            return "\(hours)h\(minutes)min"
        }
    }
}
