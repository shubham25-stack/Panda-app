//
//  ViewController.swift
//  Panda
//
//  Created by STUDENT on 4/23/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var pandaEmoji: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "quizzViewController") as! QuizzViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }
    
}

