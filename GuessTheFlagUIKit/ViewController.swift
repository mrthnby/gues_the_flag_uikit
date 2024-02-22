//
//  ViewController.swift
//  GuessTheFlagUIKit
//
//  Created by Mert Ali Hanbay on 21.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstChoice: UIButton!
    @IBOutlet var secondChoice: UIButton!
    @IBOutlet var thirdChoice: UIButton!
    @IBOutlet var scoreText: UILabel!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        firstChoice.layer.shadowColor = UIColor.black.cgColor
        firstChoice.layer.shadowRadius = 3.0
        firstChoice.layer.shadowOpacity = 0.5
        firstChoice.layer.shadowOffset = .zero

        secondChoice.layer.shadowColor = UIColor.black.cgColor
        secondChoice.layer.shadowRadius = 3.0
        secondChoice.layer.shadowOpacity = 0.5
        secondChoice.layer.shadowOffset = .zero

        thirdChoice.layer.shadowColor = UIColor.black.cgColor
        thirdChoice.layer.shadowRadius = 3.0
        thirdChoice.layer.shadowOpacity = 0.5
        thirdChoice.layer.shadowOffset = .zero
        
        navigationItem.largeTitleDisplayMode = .always

        askQuestion()
    }
    func askQuestion() {
        countries.shuffle()
        firstChoice.setImage(UIImage(named: countries[0]), for: .normal)
        secondChoice.setImage(UIImage(named: countries[1]), for: .normal)
        thirdChoice.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()

    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        var title: String

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        let ac = UIAlertController(
            title: title,
            message: "Your score is \(score).",
            preferredStyle: .alert
        )
        ac.addAction(
            UIAlertAction(
                title: "Continue",
                style: .default,
                handler: { _ in self.askQuestion()
                }
            )
        )
        present(ac, animated: true)
        scoreText.text = score.description
    }
}

