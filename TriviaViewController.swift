//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Danielle Naa Okailey Quaye on 10/4/23.
//

import UIKit

class TriviaViewController: UIViewController {
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var GeographyLabel: UILabel!
    @IBOutlet weak var thequestionLabel: UILabel!
    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    @IBOutlet weak var Answer3: UIButton!
    @IBOutlet weak var Answer4: UIButton!
    
    
    let questions = [
        Question(text: "What is the capital of Ghana and Australia respectfully?", choices: ["Paris and Accra", "Accra and Canberra", "Melbourne and Accra", "Madrid"], correctAnswer: "Accra and Canberra"),
        Question(text: "Which planet is known as the Red Planet?", choices: ["Earth", "Mars", "Venus", "Jupiter"], correctAnswer: "Mars"),
        Question(text: "Which is the capital of France?", choices: ["Barcelona", "Paris", "Madrid", "Maldives"], correctAnswer: "Paris"),
    ]
    
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
    }
    func loadQuestion() {
        if currentQuestionIndex < questions.count {
            let question = questions[currentQuestionIndex]
            QuestionLabel.text = question.text
            Answer1.setTitle(question.choices[0], for: .normal)
            Answer2.setTitle(question.choices[1], for: .normal)
            Answer3.setTitle(question.choices[2], for: .normal)
            Answer4.setTitle(question.choices[3], for: .normal)
        }
    }
        
        
    @IBAction func AnswerTapped1(_ sender: UIButton) {
        checkAnswer(selectedAnswer: Answer1)
    }
    
    @IBAction func AnswerTapped2(_ sender: UIButton) {
        checkAnswer(selectedAnswer: Answer2)
    }
    
    @IBAction func AnswerTapped3(_ sender: UIButton) {
        checkAnswer(selectedAnswer: Answer3)
    }
    
    @IBAction func AnswerTapped4(_ sender: UIButton) {
        checkAnswer(selectedAnswer: Answer4)
    }
    func checkAnswer(selectedAnswer: UIButton) {
        let question = questions[currentQuestionIndex]
        if selectedAnswer.currentTitle == question.correctAnswer {
        } else {
            selectedAnswer.backgroundColor = UIColor.red
        }
        
        // Disallow choosing of another answer
            Answer1.isEnabled = false
            Answer2.isEnabled = false
            Answer3.isEnabled = false
            Answer4.isEnabled = false
        
        
        currentQuestionIndex += 1
        loadQuestion()
        resetAnswerButtons()
            }

        func resetAnswerButtons() {
            Answer1.backgroundColor = UIColor.clear
            Answer2.backgroundColor = UIColor.clear
            Answer3.backgroundColor = UIColor.clear
            Answer4.backgroundColor = UIColor.clear

            Answer1.isEnabled = true
            Answer2.isEnabled = true
            Answer3.isEnabled = true
            Answer4.isEnabled = true
    }
}
