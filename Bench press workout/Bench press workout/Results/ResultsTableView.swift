//
//  OneRMTable.swift
//  Bench press workout
//
//  Created by Alex Freitas on 13/07/2023.
//

import SwiftUI

struct ResultsTableView: View {
    @ObservedObject var viewModel = ResultsTableViewModel()

    var body: some View {
        VStack(spacing: 1) {
            ResultsTableLineView(
                values: viewModel.getPercentageValues(),
                label: viewModel.getPercentageLabel())
            ResultsTableLineView(
                values: viewModel.getWeightValues(),
                label: viewModel.getWeightLabel())
            ResultsTableLineView(
                values: viewModel.getRepetitionValues(),
                label: viewModel.getRepetitionLabel())
        }
        .background(.gray)
    }
}

struct OneRMTable_Previews: PreviewProvider {
    static var previews: some View {
        ResultsTableView()
    }
}
