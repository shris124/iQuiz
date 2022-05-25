//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Victoria Shepard on 5/24/22.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var Result: UILabel!
    
    
    var questions: [Question] = []
    var numQuestion = 0
    var selected = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        Question.text = questions[numQuestion].question
        var correct = "The correct answer is "
        if questions[numQuestion].correct == 1 {
            correct += questions[numQuestion].option1
        } else if questions[numQuestion].correct == 2 {
            correct += questions[numQuestion].option2
        } else if questions[numQuestion].correct == 3 {
            correct += questions[numQuestion].option3
        } else if questions[numQuestion].correct == 4 {
            correct += questions[numQuestion].option4
        }
        correctAnswer.text = correct
        if selected == questions[numQuestion].correct {
            score = score + 1
            Result.text = "Answered Correctly!"
        } else {
            Result.text = "Answered Incorrectly!"
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func BackToMain(_ sender: Any) {
    }

    
    @IBAction func nextAction(_ sender: Any) {
        if (numQuestion + 1) <= questions.count {
            if let questionVC = storyboard?.instantiateViewController(withIdentifier: "questionVC") as?  QuestionViewController {
                questionVC.modalPresentationStyle = .fullScreen
                questionVC.questions = questions
                questionVC.numQuestion = numQuestion + 1
                questionVC.selected = selected
                questionVC.score = score
            }
        } else if let finishedVC = storyboard?.instantiateViewController(withIdentifier: "finishedVC") as? FinishedViewController {
            finishedVC.modalPresentationStyle = .fullScreen
            finishedVC.totalQuestions = questions.count
            finishedVC.score = score
            self.present(finishedVC, animated: true)
        }
    }
    
}
