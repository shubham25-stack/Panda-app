//
//  QuizzViewController.swift
//  Panda
//
//  Created by STUDENT on 4/23/24.
//

import UIKit

class QuizzViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    
    var quizzModels = [Question]()
    var curentQuestion: Question?
    
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
        configureUI(question: quizzModels.first!)
        table.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    private func configureUI(question:Question
    ){
        label.text = question.text
        curentQuestion = question
        table.delegate = self
        table.dataSource = self
        
    }
    
    private func checkAnswer(answer: Answer, question: Question) -> Bool{
        return question.answers.contains(where: { $0.text == answer.text }) && answer.correct
        
        
    }
    
    private func setupQuestions(){
        quizzModels.append(Question(text: "What is full form of IOS", answers: [
            Answer(text: "Internet Operating System", correct: false),
            Answer(text: "Iphone Operating System", correct: true),
            Answer(text: "nteractive Online Services", correct: false),
            Answer(text: "Intelligent Operating System", correct: false)
        ]))
        
        quizzModels.append(Question(text: "What is the capital of France?", answers: [
            Answer(text: "Madrid", correct: false),
            Answer(text: "Paris", correct: true),
            Answer(text: "London", correct: false),
            Answer(text: "Berlin", correct: false)
        ]))

        quizzModels.append(Question(text: "Who is the author of 'To Kill a Mockingbird'?", answers: [
            Answer(text: "Ernest Hemingway", correct: false),
            Answer(text: "Harper Lee", correct: true),
            Answer(text: "J.K. Rowling", correct: false),
            Answer(text: "Charles Dickens", correct: false)
        ]))
        
        quizzModels.append(Question(text: "What is the capital of Japan?", answers: [
            Answer(text: "Beijing", correct: false),
            Answer(text: "Seoul", correct: false),
            Answer(text: "Tokyo", correct: true),
            Answer(text: "Bangkok", correct: false)
        ]))

        quizzModels.append(Question(text: "Who developed the theory of relativity?", answers: [
            Answer(text: "Isaac Newton", correct: false),
            Answer(text: "Albert Einstein", correct: true),
            Answer(text: "Stephen Hawking", correct: false),
            Answer(text: "Galileo Galilei", correct: false)
        ]))

        quizzModels.append(Question(text: "Which planet is known as the Red Planet?", answers: [
            Answer(text: "Jupiter", correct: false),
            Answer(text: "Mars", correct: true),
            Answer(text: "Saturn", correct: false),
            Answer(text: "Mercury", correct: false)
        ]))

        quizzModels.append(Question(text: "Who wrote 'Romeo and Juliet'?", answers: [
            Answer(text: "William Shakespeare", correct: true),
            Answer(text: "Charles Dickens", correct: false),
            Answer(text: "Jane Austen", correct: false),
            Answer(text: "Mark Twain", correct: false)
        ]))


        quizzModels.append(Question(text: "What is the chemical symbol for gold?", answers: [
            Answer(text: "Au", correct: true),
            Answer(text: "Ag", correct: false),
            Answer(text: "Fe", correct: false),
            Answer(text: "Hg", correct: false)
        ]))

        quizzModels.append(Question(text: "Who painted the Mona Lisa?", answers: [
            Answer(text: "Vincent van Gogh", correct: false),
            Answer(text: "Pablo Picasso", correct: false),
            Answer(text: "Leonardo da Vinci", correct: true),
            Answer(text: "Michelangelo", correct: false)
        ]))

        
        quizzModels.append(Question(text: "What is full form of RAM?", answers: [
            Answer(text: "Readily Accessible Memory", correct: false),
            Answer(text: "Real-time Accessible Memory", correct: false),
            Answer(text: "Random Access Memory", correct: true),
            Answer(text: "Randomized Application Memory", correct: false)
        ]))
        
        quizzModels.append(Question(text: "What is the primary function of RAM in a computer system?", answers: [
            Answer(text: "Storage of permanent data", correct: false),
            Answer(text: "Execution of arithmetic operations", correct: false),
            Answer(text: "Temporary storage of data and program instructions", correct: true),
            Answer(text: "Processing of graphical tasks", correct: false)
        ]))
       
    }
    // table View Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizzTableViewCell", for: indexPath) as! QuizzTableViewCell
        cell.label?.text = curentQuestion?.answers[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = curentQuestion else{
            return
        }
        
        let answer = question.answers[indexPath.row]
        
        
        if checkAnswer(answer: answer, question: question) {
            if let index = quizzModels.firstIndex(where: { $0.text == question.text }) {
                if index < (quizzModels.count - 1) {
                    //next
                    let nextQuestion = quizzModels[index + 1]
                    configureUI(question: nextQuestion)
                    table.reloadData()

                }
                else{
                    // end of game
                }
            }
        }

        else {
            // wrong
            let alert = UIAlertController(title: "Wrong❗️", message: "You choose wrong answer🤧", preferredStyle:  .alert)
            alert.addAction(UIAlertAction(title: "😲k", style: .cancel, handler: nil))
            present(alert, animated: true)
        }


    }
    
}
    
    struct Question {
        let text: String
        let answers: [Answer]
    }
    struct Answer {
        let text: String
        let correct: Bool
    }

