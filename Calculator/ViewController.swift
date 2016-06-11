//
//  ViewController.swift
//  Calculator
//
//  Created by 吳萱穎 on 2016/6/9.
//  Copyright © 2016年 Why. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var userIsTypingNow = false;
	
	@IBOutlet weak var displayCalculatorResult: UILabel!

	@IBAction func performDigits(sender: UIButton) {
		let digit = sender.currentTitle!
		let displayText = displayCalculatorResult.text!
		
		if userIsTypingNow {
			displayCalculatorResult.text = displayText + digit
		} else {
			displayCalculatorResult.text = digit
		}
		
		userIsTypingNow = true
	}

	var displayValue : Double {
		get {
			return Double(displayCalculatorResult.text!)!
		}
		set {
			displayCalculatorResult.text = String(newValue)
		}
	}
	
	@IBAction func performOperation(sender: UIButton) {
		
		userIsTypingNow = false
		
		if let operation = sender.currentTitle {
			if operation == "π" {
				displayValue = M_PI
			}
			else if operation == "√" {
				displayValue = sqrt(displayValue)
			}
		}
	}
}

