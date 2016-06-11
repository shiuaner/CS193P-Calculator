//
//  ViewController.swift
//  Calculator
//
//  Created by 吳萱穎 on 2016/6/9.
//  Copyright © 2016年 Why. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	private var userIsTypingNow = false;
	
	@IBOutlet weak private var displayCalculatorResult: UILabel!

	@IBAction private func performDigits(sender: UIButton) {
		let digit = sender.currentTitle!
		let displayText = displayCalculatorResult.text!
		
		if userIsTypingNow {
			displayCalculatorResult.text = displayText + digit
		} else {
			displayCalculatorResult.text = digit
		}
		
		userIsTypingNow = true
	}

	private var displayValue: Double {
		get {
			return Double(displayCalculatorResult.text!)!
		}
		set {
			displayCalculatorResult.text = String(newValue)
		}
	}
	
	private var brainModel = CalculatorModel()
	
	@IBAction private func performOperation(sender: UIButton) {
		if (userIsTypingNow) {
			brainModel.setOperand(displayValue)
			userIsTypingNow = false
		}
		
		if let operationSymbol = sender.currentTitle {
			brainModel.performOperation(operationSymbol)
		}
		
		displayValue = brainModel.result
	}
}

