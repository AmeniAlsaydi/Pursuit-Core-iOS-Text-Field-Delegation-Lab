//
//  ViewController.swift
//  TextTwistProject
//
//  Created by Benjamin Stone on 11/4/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    
    var word = Word.getRandomWord()
    var guessedWord = [String]() // this should hold the letters the user enters

     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wordTextField.delegate = self
        // let scrambled = word.scrambled
        wordLabel.text = word.scrambled
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("new edit")
        // i think we should disable it by checking if the variable randomWordAsArray is empty.. this isnt that simple because the scope of the variable is limited to the function below. im definelty going to have to allow access to this accross the entire code because i will need to add back in the deleted string (aka letter entry" to randomWordAsArray if the user goes back.
        return true // if this is set to false the user can no longer edit the UITextfeild. it will be disabled
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard var scrambledWord = wordLabel.text else {
            return false } // so this gives me the word scrambled in the same manner as initially presented to user
        print("This is the word scrambled: \(scrambledWord)") // ✅
        var randomWordAsArray = scrambledWord.map(String.init)
        
        let randomWord = word.unscrambled
        print("This is the random word: \(randomWord)")
        
        // finds the first instance of the entered letter and removes it from the scrambled word
        if randomWordAsArray.contains(string) {
            let letterIndex = randomWordAsArray.firstIndex(of: string)
            randomWordAsArray.remove(at: letterIndex ?? 2)
            
            scrambledWord = randomWordAsArray.joined(separator:"")
            wordLabel.text = scrambledWord
            guessedWord.append(string)
            
            print("This is your guess so far: \(guessedWord)")
            // maybe: 
            // if randomWordAsArray.isEmpty()
            // disable the text feild.
            // then check if their word is correct
            if guessedWord.joined(separator:"") == randomWord {
                print("correct")
                
            }
        }
        
// remove from word and add to another string, once the scambled is empty checkmif the new word is equal to the unscrambled?
// everytime i call .scrambled it differend

        
       
        
        print(string) // returns the letter they entered.
        // print(range)
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
