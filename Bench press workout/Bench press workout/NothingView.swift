//
//  NothingView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 07/07/2023.
//

import SwiftUI

struct NothingView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {

                // MARK: Exercises steps background
//                Image("Bench press background")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: proxy.size.width, height: proxy.size.height)
//                    .overlay(stepsOverlay)

                // MARK: Results steps background
                Image("Boxer background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .blur(radius: 20)
                    .overlay(resultsOverlay)

                Text("Hello, world!")
                    .frame(width: 200.0, height: 40.0)
                    .background(Color.gray)
            }
        }
        .background(Color("Darker gray"))
        .ignoresSafeArea()
    }

    private var resultsOverlay: some View {
        Rectangle()
            .foregroundColor(Color("Darker gray"))
        .opacity(0.7)
    }

    private var stepsOverlay: some View {
        Rectangle()
            .foregroundColor(Color("Darker gray"))
        .opacity(0.9)
    }
}

struct NothingView_Previews: PreviewProvider {
    static var previews: some View {
        NothingView()
    }
}
