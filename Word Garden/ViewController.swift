//
//  ViewController.swift
//  Word Garden
//
//  Created by Yu Chang on 2/3/18.
//  Copyright © 2018 ISclass. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessLetterButton: UIButton!
    @IBOutlet weak var guessLetterField: UITextField!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
        formatUserGuessLabel()
    }
    
    //MARK: - Functions
    
    func updateUIAfterGuess() {
        guessLetterField.resignFirstResponder()
        guessLetterButton.isEnabled = false
        guessLetterField.text = ""
    }
    
    func guesseALetter () {
        formatUserGuessLabel()
        guessCount += 1
        //decrement the wrong guesses and new images
        let currentLetterGuessed = guessLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower" + "\(wrongGuessesRemaining)")
        }
    
        if wrongGuessesRemaining == 0 {
            // lost a game
            playAgainButton.isHidden = false
            guessLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So sorry, you are all out of guesses. Try Again?"
        } else if !userGuessLabel.text!.contains("_") {
            // won a game
            playAgainButton.isHidden = false
            guessLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You got it! It took you \(guessCount) guesses to guess the word!"
        } else {
            // update game count
            let guess = ( guessCount == 1 ? "Guess" : "Guesses")
//            var guess = "Guesses"
//            if (guessCount == 1) {
//                guess = "Guess"
//            }
            guessCountLabel.text = "You've Made \(guessCount) \(guess)."
        }
        
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessLetterField.text!
        for letter in wordToGuess {
            if (lettersGuessed.contains(letter)){
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    // MARK: - Actions
    
    @IBAction func guessLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessLetterField.text?.last {
            guessLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        } else {
            //disable the button if I don't have a single character in the guessLetterField
            guessLetterButton.isEnabled = false
        }

    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guesseALetter()
        updateUIAfterGuess()
        
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guesseALetter()
        updateUIAfterGuess()
        
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've Made 0 Guesses."
        guessCount = 0
    }
    

}

