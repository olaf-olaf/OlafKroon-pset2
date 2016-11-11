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
        
            // let storyMaker = Story(stream: rawText)
       
        
            storyMaker.fillInPlaceholder(word: insertWord.text!)
        
            
            wordsLeft.text = String(storyMaker.getPlaceholderRemainingCount()) + " words left"
        
            promptWord.text = "please enter a " + storyMaker.getNextPlaceholder()
        
            insertWord.placeholder = storyMaker.getNextPlaceholder()
        
            insertWord.text = nil
        
        if storyMaker.getPlaceholderRemainingCount() == 0 {
            
            performSegue(withIdentifier: "toThird", sender: nil)
        
    }
    
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        rawText = storyMaker.toString()
        let destination = segue.destination as! thirdViewController
        destination.finalStory = rawText
        
    }
}
