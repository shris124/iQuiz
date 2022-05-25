//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by iguest on 5/23/22.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var question: UILabel!

    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer4: UILabel!
    
    var questions: [Question] = []
    var numQuestion = 0
    var selected = 0
    var score = 0
    
    override func viewDidLoad() {
        print(questions)
        print( questions[numQuestion].question)
        super.viewDidLoad()
        if !questions.isEmpty {
            question.text = questions[numQuestion].question
            answer1.text = questions[numQuestion].option1
            answer2.text = questions[numQuestion].option2
            answer3.text = questions[numQuestion].option3
            answer4.text = questions[numQuestion].option4
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackToMain(_ sender: Any) {
        if let subjectVC = storyboard?.instantiateViewController(withIdentifier: "mainVC") as? ViewController {
            subjectVC.modalPresentationStyle = .fullScreen
            self.present(subjectVC, animated: true)
        }
    }
    

    @IBAction func SelectAnswer1(_ sender: Any) {
        selected = 1
    }
    
    @IBAction func SelectAnswer2(_ sender: Any) {
        selected = 2
    }
    
    @IBAction func SelectAnswer3(_ sender: Any) {
        selected = 3
    }
    
    @IBAction func SelectAnswer4(_ sender: Any) {
        selected = 4
    }
    
    @IBAction func SubmitSelectedAnswer(_ sender: Any) {
        if selected != 0 {
            if let answerVC = storyboard?.instantiateViewController(withIdentifier: "AnswerVC") as?  AnswerViewController {
                answerVC.modalPresentationStyle = .fullScreen
                answerVC.questions = questions
                answerVC.numQuestion = numQuestion
                answerVC.selected = selected
                answerVC.score = score
            }
        }
    }
    
}
