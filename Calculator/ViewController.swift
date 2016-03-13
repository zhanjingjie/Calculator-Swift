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
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("Operand Stack = \(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue;
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    func performOperationDoubleOperand(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperationSingleOperand(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        switch operation {
        case "＋": performOperationDoubleOperand{$0 + $1}
        case "－": performOperationDoubleOperand{$1 - $0}
        case "✕": performOperationDoubleOperand{$0 * $1}
        case "÷": performOperationDoubleOperand{$1 / $0}
        case "√": performOperationSingleOperand{sqrt($0)}
        default: break
        }
    }
}

