//
//  MeasurementView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 12/07/2023.
//

import SwiftUI

struct MeasurementView: View {
    @State private var maxWeight: String = ""
    @State private var repetitions: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
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
                        
                        Spacer()

                        CloseButtonView(action: {
                            presentationMode.wrappedValue.dismiss()
                        })
                    }

                    VStack(alignment: .leading) {
                        Text("Tell us your number!")
                            .font(.system(size: screenHeight * 0.03))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding()

                        Section {
                            Text("Maximum lifted weight")
                                .foregroundColor(.white)
                            TextField("KG", text: $maxWeight)
                                .keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)

                            Text("Number of repetitions with that weight")
                                .foregroundColor(.white)
                                .padding(.top)
                            TextField("", text: $repetitions)
                                .keyboardType(.numberPad)
                                .textFieldStyle(.roundedBorder)
                        }
                        .formStyle(.columns)
                        .padding()
                    }
                    .background(AppColors.exerciseBg)
                    .cornerRadius(10)

                    Spacer()

                    NavigationLink(destination: ResultsView(maxWeight: maxWeight, repetitions: repetitions)) {
                        ContinueButtonView(
                            description: "Continue"
                        )
                        .padding()
                    }
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
        .navigationBarBackButtonHidden(true)
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
