//
//  ExemploView.swift
//  Bench press workout
//
//  Created by Alex Freitas on 13/07/2023.
//

import SwiftUI

struct ExemploView: View {
    @State private var showingSecondView = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Initial View")

                Button {
                    showingSecondView = true
                } label: {
                    Text("Go to next screen (fullScreenCover)")
                }

                NavigationLink {
                    SecondView()
                } label: {
                    Text("Go to next screen (NavigationLink)")
                }
            }
            .padding()
            .navigationTitle("Navigation")
        }
        .fullScreenCover(isPresented: $showingSecondView) {
            SecondView()
        }
    }
}

struct ExemploView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            Color.green
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Second View")
                Button {
                    dismiss()
                } label: {
                    Text("Dismiss")
                }
            }
        }
    }
}
