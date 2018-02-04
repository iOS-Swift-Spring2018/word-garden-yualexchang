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
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
    }
    
    //MARK: - Functions
    
    func updateUIAfterGuess() {
        guessLetterField.resignFirstResponder()
        guessLetterButton.isEnabled = false
        guessLetterField.text = ""
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
        updateUIAfterGuess()
    }
    
    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        updateUIAfterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
    

}

