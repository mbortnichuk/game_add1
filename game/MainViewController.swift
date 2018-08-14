//
//  MainViewController.swift
//  game
//
//  Created by Mariana BORTNICHUK on 8/12/18.
//  Copyright © 2018 Mariana BORTNICHUK. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var numbersLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRandomNumberLabel()
        updateScoreLabel()
        
        inputField?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for:UIControlEvents.editingChanged)
    }

    func updateScoreLabel() {
        scoreLabel?.text = "\(score)"
    }
    
    func setRandomNumberLabel() {
        numbersLabel?.text = generateRandomString()
    }
    
    @objc func textFieldDidChange(textField:UITextField) {
        if inputField?.text?.characters.count ?? 0 < 4 {
            return
        }
        if let numbers_text = numbersLabel?.text,
            let input_text = inputField?.text,
            let numbers = Int(numbers_text),
            let input = Int(input_text) {
            print("Comparing: \(input_text) minus \(numbers_text) == \(input - numbers)")
            
            if (input - numbers == 1111) {
                print("Correct!")
                score += 1
            } else {
                print("Incorrect!")
                score -= 1
            }
        }
        setRandomNumberLabel()
        updateScoreLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func generateRandomString() -> String {
        var result:String = ""
        
        for _ in 1...4 {
            var digit:Int = Int(arc4random_uniform(8) + 1)
            result += "\(digit)"
        }
        return result
    }

}
