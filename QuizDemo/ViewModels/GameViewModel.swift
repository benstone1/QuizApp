//
//  GameViewModel.swift
//  QuizDemo
//
//  Created by Ben Stone on 1/19/22.
//

import SwiftUI

class GameViewModel: ObservableObject {
    var questionText: String {
        game.currentQuestion.text
    }
    
    var possibleAnswerIndices: Range<Int> {
        game.currentQuestion.possibleAnswers.indices
    }
    
    var correctAnswerIndex: Int {
        game.currentQuestion.correctAnswerIndex
    }
    
    var selectionWasMade: Bool {
        game.selectedIndex != nil
    }
    
    var gameIsOver: Bool {
        game.gameIsOver
    }
    
    var gameOverText: String {
        "Final Score: \(game.correctSelectionCount * 100 / game.totalQuestionCount)%"
    }
    
    func possibleAnswer(for index: Int) -> String {
        game.currentQuestion.possibleAnswers[index]
    }
    
    func makeSelection(at index: Int) {
        game.makeSelection(at: index)
    }
    
    func advanceGameState() {
        game.advanceGameState()
    }
    
    func resetGame() {
        game = Game()
    }
    
    func colorForButton(at index: Int) -> Color {
        guard selectionWasMade, index == game.selectedIndex else {
            return .clear
        }
        if game.selectionIsCorrect {
            return .green
        } else {
            return .red
        }
    }

    
    @Published private var game = Game()
}
