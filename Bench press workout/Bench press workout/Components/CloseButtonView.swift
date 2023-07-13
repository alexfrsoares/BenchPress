//
//  CloseButtonView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 13/07/2023.
//

import SwiftUI

struct CloseButtonView: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            AppImages.closeButton
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
        })
    }
}

struct CloseButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CloseButtonView(action: {

        })
        .background(AppColors.exerciseBg)
    }
}
