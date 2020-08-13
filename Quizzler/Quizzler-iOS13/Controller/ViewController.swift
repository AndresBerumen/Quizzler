//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = quizBrain.getProgress()
    }
    
    
    // MARK: Methods and Functions
    @objc func updateUI() {
        trueButton.backgroundColor = .none
        falseButton.backgroundColor = .none
        thirdButton.backgroundColor = .none
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestion()
        let options = quizBrain.getOptions()
        thirdButton.setTitle(options[0], for: .normal)
        trueButton.setTitle(options[1], for: .normal)
        falseButton.setTitle(options[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
    }
    
    
    // MARK: Actions
    @IBAction func answerButton(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight == true {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        quizBrain.nextQuestion()
        
    }
    
}

