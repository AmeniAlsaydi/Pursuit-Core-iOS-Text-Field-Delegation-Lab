//
//  ViewController.swift
//  TextTwistProject
//
//  Created by Benjamin Stone on 11/4/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    
    var word = Word.getRandomWord()
    var guessedWord = [String]()
    var randomWordAsArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordTextField.delegate = self
        wordLabel.text = word.scrambled
        
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard var scrambledWord = wordLabel.text else {
            return false } // so this gives us the word scrambled in the same manner as initially presented to user
        randomWordAsArray = scrambledWord.map(String.init)
        
        let randomWord = word.unscrambled
        
        if randomWordAsArray.contains(string) {
            
            let letterIndex = randomWordAsArray.firstIndex(of: string)
            randomWordAsArray.remove(at: letterIndex ?? 2)
            scrambledWord = randomWordAsArray.joined(separator:"")
            wordLabel.text = scrambledWord
            guessedWord.append(string)
            
        }
        
        if string == "" {
            randomWordAsArray.append(guessedWord[guessedWord.count - 1])
            scrambledWord = randomWordAsArray.joined(separator:"")
            wordLabel.text = scrambledWord
            
            let letterIndex = (guessedWord.count - 1)
            guessedWord.remove(at: letterIndex)
        }
        
         if randomWordAsArray.isEmpty {
            if guessedWord.joined(separator:"") == randomWord {
                view.backgroundColor = .green
                return false
            } else {
                view.backgroundColor = .red
                return false
            }
        }
        
        return true
    }
}

