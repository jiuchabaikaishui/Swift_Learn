//
//  ViewController.swift
//  FirstMacOSApplication
//
//  Created by 綦 on 17/4/1.
//  Copyright © 2017年 PowesunHolding. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var amountTextField: NSTextField!
    @IBOutlet weak var timeTextField: NSTextField!
    @IBOutlet weak var rateTextField: NSTextField!
    @IBOutlet weak var resultLabel: NSTextField!
    
    @IBAction func clearAction(_ sender: NSButton) {
        amountTextField.stringValue = ""
        timeTextField.stringValue = ""
        rateTextField.stringValue = ""
        resultLabel.stringValue = ""
    }

    @IBAction func calculateAction(_ sender: NSButton) {
        self.calculateOption(sender: sender)
    }
    
    @IBAction func compoundCalculateAction (_ sender: NSButton) {
        self.calculateOption(sender: sender)
    }
    
    func calculateOption(sender: NSButton){
        if amountTextField.stringValue == "" && timeTextField.stringValue == "" && rateTextField.stringValue == "" {
            resultLabel.stringValue = ""
        }
        else
        {
            let insterest : Insterest = Insterest()
            let result : Double
            if sender.title.isEqual("计算") {
                result = insterest.simpleCalculate(amount: amountTextField.doubleValue, years: Int(timeTextField.intValue), rate: rateTextField.doubleValue)
            }
            else
            {
                result = insterest.compoundCalculate(amount: amountTextField.doubleValue, years: Int(timeTextField.intValue), rate: rateTextField.doubleValue)
            }
            
            self.resultLabel.stringValue = result.currency
        }
    }

}

