//
//  ViewController.swift
//  QuizzlerTraining
//
//  Created by Zulfikar Abdul Rahman Suwardi on 25/10/22.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var choice1Text: UIButton!
  @IBOutlet weak var choice2Text: UIButton!
  @IBOutlet weak var choice3Text: UIButton!
  
  var quizBrain = QuizBrain()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
  }
  
  @IBAction func answerPressed(_ sender: UIButton) {
    
    let userAnswer = sender.currentTitle!

    let userGetRight = quizBrain.checkAnswer(userAnswer)
    if userGetRight {
      sender.backgroundColor = .systemGreen
    } else {
      sender.backgroundColor = .systemRed
    }
    
    quizBrain.nextQuestion()
  
    Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
  }
  
  @objc func updateUI() {
    questionLabel.text = quizBrain.getQuestionText()
    choice1Text.setTitle(quizBrain.getMultiAnswer()[0], for: .normal)
    choice2Text.setTitle(quizBrain.getMultiAnswer()[1], for: .normal)
    choice3Text.setTitle(quizBrain.getMultiAnswer()[2], for: .normal)
    scoreLabel.text = "Score = \(quizBrain.getScore())"
    progressView.progress = quizBrain.getProgress()
    choice1Text.backgroundColor = .clear
    choice2Text.backgroundColor = .clear
    choice3Text.backgroundColor = .clear
  }
  
}

