//
//  Game.swift
//  QuizDemo
//
//  Created by Ben Stone on 1/19/22.
//

import Foundation

struct Game {
    // MARK: - Internal Properties
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    var selectionIsCorrect: Bool {
        selections[currentQuestion] == currentQuestion.correctAnswerIndex
    }
    
    var selectedIndex: Int? {
        selections[currentQuestion]
    }
    
    var gameIsOver: Bool {
        currentQuestionIndex > questions.count - 1
    }
    
    var correctSelectionCount: Int {
        var count = 0
        for (question, selectedI) in selections {
            if question.correctAnswerIndex == selectedI {
                count += 1
            }
        }
        return count
    }
    
    var totalQuestionCount: Int {
        questions.count
    }
    
    mutating func advanceGameState() {
        currentQuestionIndex += 1
    }
    
    mutating func makeSelection(at index: Int) {
        selections[currentQuestion] = index
    }
    
    // MARK: - Private Properties
    
    private let questions = Question.allQuestions.shuffled()
    private var currentQuestionIndex = 0
    private var selections = [Question: Int]()
}
