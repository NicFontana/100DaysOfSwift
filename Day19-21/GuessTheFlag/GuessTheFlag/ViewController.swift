//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Niccolò Fontana on 29/05/2020.
//  Copyright © 2020 Niccolò Fontana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswerIndex = 0
    var score = 0
    var questionsAskedCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy",
        "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        newGame()
    }
    
    func newGame(action: UIAlertAction! = nil) {
        score = 0
        questionsAskedCount = 0
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        if (questionsAskedCount < 10) {
            questionsAskedCount += 1
            
            countries.shuffle()
            correctAnswerIndex = Int.random(in: 0...2)
            
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
            
            title = "\(countries[correctAnswerIndex].uppercased()) - Score: \(score)"
        } else {
            title = "\(countries[correctAnswerIndex].uppercased()) - Final score: \(score)"
            
            let finalAC = UIAlertController(
                title: "Finish!",
                message: "Your final score is \(score)",
                preferredStyle: .alert
            )
            let continueAction = UIAlertAction(title: "Play Again", style: .default, handler: newGame)
            finalAC.addAction(continueAction)
            present(finalAC, animated: true)
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswerIndex {
            score += 1
            askQuestion()
        } else {
            score -= 1
            let wrongAnswerAC = UIAlertController(
                title: "Wrong",
                message: "That's the flag of \(countries[sender.tag].uppercased())",
                preferredStyle: .alert
            )
            let continueAction = UIAlertAction(title: "Continue", style: .default, handler: askQuestion)
            wrongAnswerAC.addAction(continueAction)
            present(wrongAnswerAC, animated: true)
        }
    }
}

