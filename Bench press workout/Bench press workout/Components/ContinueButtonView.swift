//
//  ContinueButtonView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 09/07/2023.
//

import SwiftUI

struct ContinueButtonView: View {
    @Binding var description: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4.0)
                .foregroundColor(AppColors.button)
            Text(description)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .frame(height: 47)
    }
}
