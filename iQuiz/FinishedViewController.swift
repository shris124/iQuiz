//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Victoria Shepard on 5/24/22.
//

import UIKit

class FinishedViewController: UIViewController {

    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Score: UILabel!
    
    var totalQuestions = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Score.text = "\(score)/\(totalQuestions)"
        let ratio = Double(score)/Double(totalQuestions)
        if ratio == 1.0 {
            Description.text = "Perfect Score!"
        } else if ratio >= 0.5 {
            Description.text = "Average!"
        } else if ratio <= 0.5 {
            Description.text = "Below Average!"
        } else if ratio == 0.0 {
            Description.text = "You failed!"
        }
    }
    
    @IBAction func BackToMain(_ sender: Any) {
        if let subjectVC = storyboard?.instantiateViewController(withIdentifier: "mainVC") as? ViewController {
            subjectVC.modalPresentationStyle = .fullScreen
            self.present(subjectVC, animated: true)
        }
    }


}
