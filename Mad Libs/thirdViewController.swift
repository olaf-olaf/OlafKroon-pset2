//
//  thirdViewController.swift
//  Mad Libs
//
//  Created by Olaf Kroon on 08/11/16.
//  Copyright © 2016 Olaf Kroon. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {
    @IBOutlet weak var showStory: UITextView!
    
    

    var finalStory: String?
   

    override func viewDidLoad() {
        //super.viewDidLoad()
        showStory.text = finalStory

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
