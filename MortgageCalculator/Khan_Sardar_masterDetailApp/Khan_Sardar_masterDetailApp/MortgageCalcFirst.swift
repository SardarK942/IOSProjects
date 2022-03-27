//
//  MortgageCalcFirst.swift
//  Khan_Sardar_masterDetailApp
//
//  Created by Sardar Khan on 3/18/22.
//

import UIKit

class MortgageCalcFirst: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var propertyPriceLabel: UITextField!
    
    @IBOutlet weak var downPaymentCash: UITextField!
    
    @IBOutlet weak var downPaymentPercent: UITextField!
    
    @IBOutlet weak var lengthOfLoan: UISegmentedControl!
    
    @IBOutlet weak var interestRate: UITextField!
    
    var lol = 5;
    
    var mortgageClass: MortgageClass? = nil;
    
    
    func validateInputs() -> Bool{
        guard let propPriceText = propertyPriceLabel.text, !propPriceText.isEmpty else {
               // alert that the text field is empty
            return false
           }
        return true;
        
        
        
        
    }
    
    
    @IBAction func downPaymentCashAdded(_ sender: Any) {
//        downPaymentPercent.text =  propertyPriceLabel.text
        guard let propPriceText = propertyPriceLabel.text, !propPriceText.isEmpty else {
               // alert that the text field is empty
               return
           }
           guard let price = Double(propPriceText), price >= 0 else {
               // alert that you can't have negative points or that the entered text did not convert to a number
               return
           }
        guard let dp = Double(downPaymentCash.text ?? ""), dp > 0 else {
               // alert that you can't have negative or zero games or that the entered text did not convert to a number
               return
           }
           let percentDp = dp/price
        downPaymentPercent.text = "\(percentDp * 100)"
    }
    
    @IBAction func downPaymentPercentAdded(_ sender: Any) {
        guard let propPriceText = propertyPriceLabel.text, !propPriceText.isEmpty else {
               // alert that the text field is empty
               return
           }
           guard let price = Double(propPriceText), price >= 0 else {
               // alert that you can't have negative points or that the entered text did not convert to a number
               return
           }
        guard let dp = Double(downPaymentPercent.text ?? ""), dp > 0 else {
               // alert that you can't have negative or zero games or that the entered text did not convert to a number
               return
           }
        print(dp)
           let cashAmount = Int((dp / 100) * price)
        downPaymentCash.text = "\(cashAmount)"
    }
    
    @IBAction func propertyPriceAdded(_ sender: Any) {
        let downPaymentCashStr = downPaymentCash.text
        let downPaymentPrcentStr = downPaymentPercent.text
        
        if(downPaymentCashStr!.isEmpty && downPaymentPrcentStr!.isEmpty){
            return
        }
        
        guard let propPrice = Double(propertyPriceLabel.text ?? ""), propPrice > 0 else {
               // alert that you can't have negative or zero games or that the entered text did not convert to a number
               return
           }
        print(propPrice)
           
        if(downPaymentCashStr!.isEmpty){
            guard let dp = Double(downPaymentPercent.text ?? ""), dp > 0 else {
                   // alert that you can't have negative or zero games or that the entered text did not convert to a number
                   return
               }
            let cashAmount = Int((dp / 100) * propPrice)
            downPaymentCash.text = "\(cashAmount)"
            }
        if(downPaymentPrcentStr!.isEmpty){
            guard let dp = Double(downPaymentCash.text ?? ""), dp > 0 else {
                   // alert that you can't have negative or zero games or that the entered text did not convert to a number
                   return
               }
               let percentDp = dp/propPrice
            downPaymentPercent.text = "\(percentDp * 100)"
        }
    }
    
    
    @IBAction func segmentClick(_ sender: UISegmentedControl) {
            if(sender.selectedSegmentIndex == 0){
                lol = 5;
            }
            if(sender.selectedSegmentIndex == 1){
                lol = 15;
            }
            if(sender.selectedSegmentIndex == 2){
               lol = 30
            }
            
        }
    
    class MortgageClass {
        let propertyPrice: Int
        let downPayment: Int
        let apr: Double
        let lol: Int
        var propTaxes: Int
        var managementFees: Int
        var insuranceFees: Int
        var isInvestment: Bool
        var miscFees: Int
        var income: Int
        var officialMortgageAmt: Int
        
        init(propertyPrice: Int, downPayment: Int, apr: Double, lol: Int, propTaxes: Int, managementFees: Int, insuranceFees: Int, isInvestment: Bool, miscFees: Int, income: Int, officialMortgageAmt: Int){
            self.propertyPrice = propertyPrice;
            self.downPayment = downPayment;
            self.apr = apr;
            self.lol = lol;
            self.propTaxes = propTaxes;
            self.managementFees = managementFees;
            self.insuranceFees = insuranceFees;
            self.isInvestment = isInvestment;
            self.miscFees = miscFees;
            self.income = income;
            self.officialMortgageAmt = officialMortgageAmt;
        }
        
    }
    
    func calculateMortgage(_ mortgageClass: MortgageClass) -> Int {
        let newApr = (mortgageClass.apr/100)/12;
        let tenure = mortgageClass.lol * 12;
        let mortgageAmt = mortgageClass.propertyPrice - mortgageClass.downPayment;
        return Int(((Double(mortgageAmt) * newApr)/(1 - pow(1/(1+newApr), Double(tenure)))))
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if(!validateInputs()){
            return
        }
        
        let propPrice = Int(propertyPriceLabel.text!)
        let dp = Int(downPaymentCash.text!)
        let apr = Double(interestRate.text!)
        
        
         mortgageClass = MortgageClass(propertyPrice: propPrice!, downPayment: dp!, apr: apr!, lol: lol, propTaxes: 0, managementFees: 0, insuranceFees: 0, isInvestment: false, miscFees: 0, income: 0, officialMortgageAmt: 0);
        
        mortgageClass!.officialMortgageAmt =  calculateMortgage(mortgageClass!);
        print(mortgageClass!.officialMortgageAmt);
        print(mortgageClass!.officialMortgageAmt);
        print(mortgageClass);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        // Create a variable to store the name the user entered on textField
            
        // Create a new variable to store the instance of the SecondViewController
        // set the variable from the SecondViewController that will receive the data
        let destinationVC = segue.destination as! secondPage
        destinationVC.mortgageInfo = mortgageClass;
    }
    
}
