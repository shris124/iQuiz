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
        Subject(title: "Mathematics", description: "Test your mathematical skills", imageName: "math", questions: [Question(question: "What is 2 * 2", option1: "1", option2: "2", option3: "3", option4: "4", correct: 4), Question(question: "What is 32/16", option1: "4", option2: "16", option3: "2", option4: "8", correct: 3), Question(question: "What is the 42 + 6 * 3", option1: "84", option2: "50", option3: "60", option4: "70", correct: 3)]),
        Subject(title: "Marvel Super Heroes", description: "Test your marvel trivia skills", imageName: "marvel", questions: [Question(question: "How many infinity stones are there?", option1: "6", option2: "5", option3: "8", option4: "9", correct: 1), Question(question: "What is the name of the thor's hammer?", option1: "Mjolnir", option2: "Loki", option3: "Ragnarok", option4: "Time Stone", correct: 1), Question(question: "what is the first movie in time chronlogical order?", option1: "Avengers: Endgame", option2: "Ant-Man and the Wasp", option3: "Spiderman Homecoming", option4: "Captain America: The First Avenger", correct: 4)]),
        Subject(title: "Science", description: "Test your science skills", imageName: "science", questions: [Question(question: "What is the center of an atom", option1: "Nucleus", option2: "Hydrogen", option3: "Proton", option4: "Electron", correct: 1), Question(question: "How many hearts does an octupus have?", option1: "1", option2: "2", option3: "3", option4: "4", correct: 3), Question(question: "How many colors does a rainbow have?", option1: "4", option2: "5", option3: "6", option4: "7", correct: 4)]),
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
        return 250
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
    let option1: String!
    let option2: String!
    let option3: String!
    let option4: String!
    let correct: Int!
    
    init(question: String, option1: String, option2: String, option3: String, option4: String, correct: Int) {
        self.question = question
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
        self.correct = correct
    }
    
}
