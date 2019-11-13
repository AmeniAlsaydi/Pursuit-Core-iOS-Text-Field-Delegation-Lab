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
    
    var word = Word.getRandomWord() // generates random word
    var guessedWord = [String]() // this should hold the letters the user enters
    var randomWordAsArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordTextField.delegate = self
        // let scrambled = word.scrambled
        wordLabel.text = word.scrambled
        
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard var scrambledWord = wordLabel.text else {
            return false } // so this gives us the word scrambled in the same manner as initially presented to user
        print("This is the word scrambled: \(scrambledWord)") // ✅
        randomWordAsArray = scrambledWord.map(String.init)
        
        let randomWord = word.unscrambled
        print("This is the random word: \(randomWord)")
        
        if randomWordAsArray.isEmpty {
            view.backgroundColor = .red
            return false
        }
        
        
        // finds the first instance of the entered letter and removes it from the scrambled word
        if randomWordAsArray.contains(string) {
            
            let letterIndex = randomWordAsArray.firstIndex(of: string)
            randomWordAsArray.remove(at: letterIndex ?? 2)
            
            scrambledWord = randomWordAsArray.joined(separator:"")
            wordLabel.text = scrambledWord
            guessedWord.append(string)
            
            print("This is your guess so far: \(guessedWord)")
            
        }
        // this is when they delete which means that string == ""
        if string == "" {
            randomWordAsArray.append(guessedWord[guessedWord.count - 1])
            scrambledWord = randomWordAsArray.joined(separator:"")
            wordLabel.text = scrambledWord
            
            print("before removal: \(guessedWord)")
            let letterIndex = (guessedWord.count - 1)
            guessedWord.remove(at: letterIndex)
            print("after removal: \(guessedWord)")
            
        }
        
        if guessedWord.joined(separator:"") == randomWord {
            view.backgroundColor = .green
            print("correct")
            
        }
          
        print(string) // returns the letter they entered.
        // print(range)
        print("randomeWordArray: \(randomWordAsArray)")
        
        return true
    }
}



//        for (index,char) in word.unscrambled.enumerated() {
//            if string == char.description {
//                // remove from word.scrambled
//            }
//        }

//==== maybe the below isnt needed
//if word.unscrambled.hasPrefix(string){
//    print("\(string) is the first letter in \(word.unscrambled)")
//}
