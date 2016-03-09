//
//  ViewController.swift
//  Calculator
//
//  Created by Jingjie Zhan on 3/9/16.
//  Copyright © 2016 Jingjie Zhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber : Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if (userIsInTheMiddleOfTypingANumber) {
            display.text = display.text! + digit;
        } else {
            display.text = digit;
            userIsInTheMiddleOfTypingANumber = true
        }
    }
}

