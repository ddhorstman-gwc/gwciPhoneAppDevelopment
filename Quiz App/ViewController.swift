//
//  ViewController.swift
//  Quiz App
//
//  Created by David Hortsman on 6/1/18.
//  Copyright © 2018 David Hortsman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    var questions: [Question] = [
        Question(
            question: "Which of the following boolean expressions will return true?",
            answers: ["true&&false", "!(true&&false||(true||false))", "false||!(true&&false)", "true&&(false||(false&&true))"],
            correctAnswer: 2),
        Question(
            question: "Which part of the CPU is responsible for addition?",
            answers: ["Addition and Subtraction Unit", "Arithmetic and Logic Unit", "Mathematical Logic Unit", "Calculation Unit"],
            correctAnswer: 1),
        Question(
            question: "How many questions are on this quiz",
            answers: ["One", "Two", "Three", "Four"],
            correctAnswer: 2)
    ]
    
    var currentQuestion: Question?
    var currentQuestionIndex: Int = 0
    var numberQuestionsCorrect: Int = 0
    
    func setQuestion(){
    questionText.text=currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        questionFeedback.text="Question: \(currentQuestionIndex+1)/ \(questions.count)"
    }
    
    func loadNextQuestion(){
        if(currentQuestionIndex+1>=questions.count){
        performSegue(withIdentifier: "sgShowResults", sender: nil)
        } else{
            currentQuestionIndex += 1
            currentQuestion = questions[currentQuestionIndex]
            setQuestion()
        }
    }
    
    func checkAnswer(idx: Int){
        if(idx==currentQuestion!.correctAnswer){
        numberQuestionsCorrect += 1
        }
        loadNextQuestion()
    }

    @IBOutlet weak var questionFeedback: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer0: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = questions[0]
        setQuestion()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func submitAnswer0(_ sender: Any) {
        checkAnswer(idx: 0)
    }
    @IBAction func submitAnswer1(_ sender: Any) {
        checkAnswer(idx: 1)
    }
    @IBAction func submitAnswer2(_ sender: Any) {
        checkAnswer(idx: 2)
    }
    @IBAction func submitAnswer3(_ sender: Any) {
        checkAnswer(idx: 3)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgShowResults") {
            let vc = segue.destination as! ResultsViewController
            vc.numberCorrect = numberQuestionsCorrect
            vc.total = questions.count
        }
    }
    
}

