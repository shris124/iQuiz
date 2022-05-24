//
//  ViewController.swift
//  iQuiz
//
//  Created by iguest on 5/23/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    struct Subject {
        let title: String
        let description: String
        let imageName: String
        let questions: [Question]
    }

    var settings: UIAlertController!
    var subjects: [Subject] = [
        Subject(title: "Mathematics", description: "Test your mathematical skills", imageName: "math", questions: [Question(question: "What is 2 * 2", answer1: "1", answer2: "2", answer3: "3", answer4: "4", correct: 4), Question(question: "What is 32/16", answer1: "4", answer2: "16", answer3: "2", answer4: "8", correct: 3), Question(question: "What is the 42 + 6 * 3", answer1: "84", answer2: "50", answer3: "60", answer4: "70", correct: 3)]),
        Subject(title: "Marvel Super Heroes", description: "Test your marvel trivia skills", imageName: "marvel", questions: [Question(question: "How many infinity stones are there?", answer1: "6", answer2: "5", answer3: "8", answer4: "9", correct: 1), Question(question: "What is the name of the thor's hammer?", answer1: "Mjolnir", answer2: "Loki", answer3: "Ragnarok", answer4: "Time Stone", correct: 1), Question(question: "what is the first movie in time chronlogical order?", answer1: "Avengers: Endgame", answer2: "Ant-Man and the Wasp", answer3: "Spiderman Homecoming", answer4: "Captain America: The First Avenger", correct: 4)]),
        Subject(title: "Science", description: "Test your science skills", imageName: "science", questions: [Question(question: "What is the center of an atom", answer1: "Nucleus", answer2: "Hydrogen", answer3: "Proton", answer4: "Electron", correct: 1), Question(question: "How many hearts does an octupus have?", answer1: "1", answer2: "2", answer3: "3", answer4: "4", correct: 3), Question(question: "How many colors does a rainbow have?", answer1: "4", answer2: "5", answer3: "6", answer4: "7", correct: 4)]),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settings = UIAlertController(title: "Settings", message: "Settings go here/OK", preferredStyle: .alert)
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickSettings(_ sender: Any) {
        self.present(settings, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subject = subjects[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubjectTableViewCell
        cell.Title.text = subject.title
        cell.Description.text = subject.description
        cell.SubjectImage.image = UIImage(named: subject.imageName)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let questionVC = storyboard?.instantiateViewController(withIdentifier: "questionVC") as? QuestionViewController {
            questionVC.modalPresentationStyle = .fullScreen
            questionVC.questions = subjects[indexPath.row].questions
            self.present(questionVC, animated: true)
        }
    }

}

class Question {
    
    let question: String!
    let answer1: String!
    let answer2: String!
    let answer3: String!
    let answer4: String!
    let correct: Int!
    
    init(question: String, answer1: String, answer2: String, answer3: String, answer4: String, correct: Int) {
        self.question = question
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        self.correct = correct
    }
    
}
