//
//  ResultsView.swift
//  QuizDemo
//
//  Created by Ben Stone on 1/19/22.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.gameOverText)
                .font(.title)
            Spacer()
            Button("New Game") {
                viewModel.resetGame()
            }
            .padding()
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
