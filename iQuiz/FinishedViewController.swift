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
            Description.text = "You got 100%!"
        } else if ratio >= 0.75 {
            Description.text = "You got 75%!"
        } else if ratio >= 0.5 {
            Description.text = "You got 50%!"
        } else if ratio >= 0.25 {
            Description.text = "You got 25%!"
        } else {
            Description.text = "You failed!"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackToMain(_ sender: Any) {
        if let subjectVC = storyboard?.instantiateViewController(withIdentifier: "mainVC") as? ViewController {
            subjectVC.modalPresentationStyle = .fullScreen
            self.present(subjectVC, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
