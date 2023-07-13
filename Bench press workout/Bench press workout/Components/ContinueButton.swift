//
//  ContinueButton.swift
//  Bench press workout
//
//  Created by Alex Freitas on 09/07/2023.
//

import SwiftUI

struct ContinueButton: View {
    @Binding var description: String
    let action: () -> Void

    var body: some View {
        Button(action: action, label: {
            ContinueButtonView(description: description)
        })
    }
}

struct ContinueButtonBView: View {
    @Binding var description: String

    var body: some View {
        Button(action: { }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 4.0)
                    .foregroundColor(AppColors.button)
                Text(description)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        })
        .frame(height: 47)
    }
}
