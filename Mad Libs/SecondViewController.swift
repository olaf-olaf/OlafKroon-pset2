//
//  SecondViewController.swift
//  Mad Libs
//
//  Created by Olaf Kroon on 07/11/16.
//  Copyright © 2016 Olaf Kroon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var wordsLeft: UILabel!
    @IBOutlet weak var enterWord: UIButton!
    @IBOutlet weak var insertWord: UITextField!
    @IBOutlet weak var promptWord: UILabel!
    @IBOutlet weak var cheer: UILabel!
    
    var cheerVariations: [String] = ["Go on!", "That's it!", "Impressive!", "Keep on going", "Right on", "This is going to be fun!", "Not bad", "The force is strong in you", "Classic, as always", "Good one!", "You're a pro", "Very well", "You enlighten me", "OMG don't stop", "You're on fire!", "Sheer genius!", "LIT", "HORSEFIGHTER", "Dayum", "Almost there!", "You must continue!", "Don't stop", "ROFL", "So so good", "You can't be stopped", "Well, thats possible", "I'm moved by this", "That's it, baby", "How creative", "BIEM", "Consider comedy, seriously"]
    
    
    var rawText = String()
    
    // create a Story object.
    var storyMaker = Story(stream: String())
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize a Story object.
        storyMaker = Story(stream: rawText)

        // Display amount of placeholders left.
        wordsLeft.text = String(storyMaker.getPlaceholderRemainingCount()) + " words left"
        
        // Display the type of word the user needs to enter.
        promptWord.text = "please enter a " + storyMaker.getNextPlaceholder()
        
        // Display the type of word the user needs to enter in the placeholder.
        insertWord.placeholder = storyMaker.getNextPlaceholder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // If the button is clicked update rawText and the display.
    @IBAction func enterPressed(_ sender: Any) {
        
        
        
        if (insertWord.text?.isEmpty)! {
            let alert = UIAlertView()
            alert.title = "Enter a word, silly"
            alert.addButton(withTitle: "Ok")
            alert.show()
        }
        else {
            storyMaker.fillInPlaceholder(word: insertWord.text!)
        
            
            wordsLeft.text = String(storyMaker.getPlaceholderRemainingCount()) + " words left"
        
            promptWord.text = "please enter a " + storyMaker.getNextPlaceholder()
        
            insertWord.placeholder = storyMaker.getNextPlaceholder()
        
            insertWord.text = nil
        
            // Cheer to the user.
            cheer.text = chooseCheer()
            cheer.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        
            if storyMaker.getPlaceholderRemainingCount() == 0 {
            
                performSegue(withIdentifier: "toThird", sender: nil)
        
            }
        }
    
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        rawText = storyMaker.toString()
        let destination = segue.destination as! thirdViewController
        destination.finalStory = rawText
        
    }
    
    // a function that returns a random element from the 'madLibList' array.
    func chooseCheer() -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(cheerVariations.count)))
        let result = self.cheerVariations[randomIndex]
        return result

    }
}
