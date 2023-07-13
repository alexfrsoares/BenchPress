//
//  MeasurementView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 12/07/2023.
//

import SwiftUI

struct MeasurementView: View {
    @State var maxWeight: String = ""
    @State var repetitions: String = ""

    var body: some View {
        GeometryReader { proxy in
            let screenWidth = proxy.size.width
            let screenHeight = proxy.size.height

            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text("After you have completed your assessment.")
                        .font(.system(size: screenHeight * 0.03))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .frame(maxWidth: screenWidth * 0.45)
//                        .padding(.leading, 0)
//                        .padding(.bottom)
                    Spacer()
//                        .frame()
                    CloseButtonView(action: {

                    })
                }

                VStack(alignment: .leading) {
                    Text("Tell us your number!")
                        .font(.system(size: screenHeight * 0.03))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding()

                    Form {
                        Text("Maximum lifted weight")
                            .foregroundColor(.white)
                        TextField("", text: $maxWeight)
                            .textFieldStyle(.roundedBorder)

                        Text("Number of repetitions with that weight")
                            .foregroundColor(.white)
                            .padding(.top)
                        TextField("", text: $repetitions)
                            .textFieldStyle(.roundedBorder)
                    }
                    .formStyle(.columns)
                    .padding()
                }
                .background(AppColors.exerciseBg)
                .cornerRadius(10)

                Spacer()

                ContinueButtonView(
                    description: .constant("Continue"),
                    action: {
                        print("I'm here!")
                    }
                )
                .padding()
            }
            .padding()
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

struct MeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementView()
    }
}
