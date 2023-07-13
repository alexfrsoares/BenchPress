//
//  ResultsView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 12/07/2023.
//

import SwiftUI

struct ResultsView: View {
    @State var user1RM: String = "126"

    var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height
            let tableWidth = screenWidth * 0.9

            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    CloseButtonView(action: {
                        
                    })
                }
                .frame(width: tableWidth)
                .padding(.bottom)

                Text("Results")
                    .textCase(.uppercase)
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        HStack(alignment: .bottom, spacing: 4) {
                            Text(user1RM)
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("kg")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        Text("Your 1RM")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                    .padding()

                    Text("Percentages of 1RM")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(.horizontal)

                    ResultsTableView()
                        .frame(height: screenHeight * 0.15)
                        .border(Color.gray)

                    Text("Knowing your 1RM can enhance performance. It helps set training intensity, track progress, and improve strenght and power.")
                        .font(.system(size: 22))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(.top)
                        .padding(.horizontal)

                    Text("**During workouts**, you'll often be instructed to use **the percentage of your 1RM**.")
                        .font(.system(size: 22))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding()
                }
                .frame(width: tableWidth)
                .background(AppColors.exerciseBg)
                .cornerRadius(10)

                HStack(spacing: 14) {
                    AppImages.smartphone

                    Text("Take a screenshot")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                }
                .frame(width: tableWidth)
                .padding(.top)

                Spacer()
            }
            .frame(width: screenWidth)
        }
        .background {
            AppImages.resultsScreenBg
                .resizable()
                .scaledToFill()
                .blur(radius: 20)
                .ignoresSafeArea()
                .overlay(resultsOverlay)
        }
    }

    private var resultsOverlay: some View {
        Rectangle()
            .foregroundColor(AppColors.exerciseBg)
            .ignoresSafeArea()
            .opacity(0.5)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
