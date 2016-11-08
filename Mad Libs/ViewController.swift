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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //print(text)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // A function that loads a text file and stores it into a string
    func loadText() -> String {
        var contents = String()
        if let filepath = Bundle.main.path(forResource: "madlib1_tarzan", ofType: "txt")
        {
            do {
                contents = try String(contentsOfFile: filepath)
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        return contents
    }
    
    
    // segue contents to the rawtext variable in the the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        text = loadText()
        var destination: SecondViewController = segue.destination as! SecondViewController
        destination.rawText = text
    }
}



