//
//  Question.swift
//  QuizDemo
//
//  Created by Ben Stone on 1/19/22.
//

import Foundation

struct Question: Hashable {
    let text: String
    let possibleAnswers: [String]
    let correctAnswerIndex: Int
    
    static let allQuestions: [Question] = [
        Question(text: "What was the first computer bug",
                 possibleAnswers: ["Moth", "Ant", "Fly", "Beetle"], correctAnswerIndex: 0),
        Question(text: "What language was used before Swift?",
                 possibleAnswers: ["Python", "Typescript", "Ruby", "Objective-C"],
                 correctAnswerIndex: 3)
    ]
}
