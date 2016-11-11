//
//  ViewController.swift
//  Mad Libs
//
//  Created by Olaf Kroon on 07/11/16.
//  Copyright © 2016 Olaf Kroon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // A variable to store the story in
    var text = String()
    
    // An array with al the possible madlib stories.
    var madLibList: [String] = ["madlib0_simple", "madlib1_tarzan", "madlib2_university", "madlib3_clothes", "madlib4_dance"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // A function that loads a text file and stores it into a string 'contents'.
    func loadText() -> String {
        var contents = String()
        if let filepath = Bundle.main.path(forResource: chooseStory(), ofType: "txt")
        {
            do {
                contents = try String(contentsOfFile: filepath)
            } catch {
                print("contents could not be loaded!")
            }
        } else {
            print("example.txt not found!")
        }
        return contents
    }
    
    
    // segue 'contents' string to the 'rawText' variable in the the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        text = loadText()
        let destination: SecondViewController = segue.destination as! SecondViewController
        destination.rawText = text
    }
    
    // a function that returns a random element from the 'madLibList' array.
    func chooseStory() -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(madLibList.count)))
        let result = self.madLibList[randomIndex]
        return result
        
    }
}



