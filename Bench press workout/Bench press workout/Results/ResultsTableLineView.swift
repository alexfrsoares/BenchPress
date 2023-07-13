//
//  ResultsTableLineView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 13/07/2023.
//

import SwiftUI

struct ResultsTableLineView: View {
    @State var values: [String]
    @State var label: String
    
    var body: some View {
        HStack(spacing: 1) {
            ForEach(values, id: \.self) { value in
                ZStack {
                    Rectangle()
                        .foregroundColor(AppColors.exerciseBg)
                    Text(value)
                        .foregroundColor(.gray)
                }
            }
            ZStack {
                Rectangle()
                    .foregroundColor(AppColors.exerciseBg)
                Text(label)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .background(.gray)
    }
}

struct ResultsTableLineView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsTableLineView(values: ["ABC", "DEF", "GHI", "JKL", "MNO", "PQR"], label: "XYZ")
    }
}
