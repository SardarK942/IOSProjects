//
//  ViewController.swift
//  sardar_Khan_CalculatorApp
//
//  Created by Sardar Khan on 1/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CalculatorWorkings: UILabel!
    @IBOutlet weak var CalculatorResults: UILabel!
    
    var workings: String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll(){
        workings = ""
        CalculatorWorkings.text = ""
        CalculatorResults.text = ""
    }
    func addToWorkings(value: String){
        workings = workings + value
        CalculatorWorkings.text = workings
    }
    
    @IBAction func backTap(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            CalculatorWorkings.text = workings
        }
    }
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func plusTap(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func equalsTap(_ sender: Any) {
        
        let expression = NSExpression(format: workings)
        let res = expression.expressionValue(with: nil, context: nil) as! Int
        let resString = String(res)
        CalculatorResults.text = resString
    }
    
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkings(value: "0")

    }
    
    
    @IBAction func oneTap(_ sender: Any) {
        addToWorkings(value: "1")

    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorkings(value: "2")

    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorkings(value: "3")

    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorkings(value: "4")

    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorkings(value: "5")

    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorkings(value: "6")

    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkings(value: "7")

    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorkings(value: "8")

    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorkings(value: "9")

    }
    
}

