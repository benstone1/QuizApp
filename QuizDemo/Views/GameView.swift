//
//  ContentView.swift
//  QuizDemo
//
//  Created by Ben Stone on 1/19/22.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            Color(.sRGB, red: 0.7, green: 0.7, blue: 0.5, opacity: 0.2)
                .edgesIgnoringSafeArea(.all)
            if viewModel.gameIsOver {
                ResultsView()
                    .environmentObject(viewModel)
            } else {                
                VStack {
                    Text(viewModel.questionText)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    VStack {
                        ForEach(viewModel.possibleAnswerIndices) { index in
                            Button(viewModel.possibleAnswer(for: index)) {
                                viewModel.makeSelection(at: index)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(viewModel.colorForButton(at: index))
                            .border(Color.blue, width: 4)
                            .disabled(viewModel.selectionWasMade)
                        }
                    }
                    .fixedSize(horizontal: true, vertical: false)
                    Spacer()
                    if viewModel.selectionWasMade {
                        Button("Next") {
                            viewModel.advanceGameState()
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
