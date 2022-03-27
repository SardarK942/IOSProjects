//
//  secondPage.swift
//  Khan_Sardar_masterDetailApp
//
//  Created by Sardar Khan on 3/18/22.
//

import Foundation
import UIKit

class secondPage: UIViewController {
    
    @IBOutlet weak var segmentedPrimaryOrRental: UISegmentedControl!
    
    @IBOutlet weak var officialMonthlyMortgageLabel: UILabel!
    
    @IBOutlet weak var propertyTaxesCash: UITextField!
    
    @IBOutlet weak var propertyTaxesPercent: UITextField!
    
    @IBOutlet weak var insuranceAmount: UITextField!
    
    @IBOutlet weak var managementFeesCash: UITextField!
    @IBOutlet weak var managementFeesPercent: UITextField!
    
    @IBOutlet weak var miscVacancyFeesCash: UITextField!
    
    @IBOutlet weak var miscVacancyFeesPerecent: UITextField!
    
    var mortgageInfo: MortgageCalcFirst.MortgageClass?
    
    var propPrice : Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        officialMonthlyMortgageLabel.text =
        "\(String(describing: mortgageInfo!.officialMortgageAmt))";
        
        propPrice = mortgageInfo!.propertyPrice;
        
        isPrimary();
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Okay!", message: "Calculating all data now 🤖", preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "let's go", style: .cancel, handler: {  _ in self.performSegue(withIdentifier: "goToFinal", sender: nil)

        } ))
        present(alert, animated: true);
        print("HERE")
        
    }
    
    func showActionSheet(){
        let actionSheet = UIAlertController(title: "Almost there", message: "Please Insert your expected Rental income below (ONLY Numbers!)", preferredStyle: .alert);
    
        
        actionSheet.addTextField { (textField) in
                                  textField.placeholder = "Rental Income"
                              }
        
        let continueAction = UIAlertAction(title: "Continue",
                                           style: .default) { [weak actionSheet] _ in
                                            guard let textFields = actionSheet?.textFields else { return }
                                            
                                            if let rentalIncome = textFields[0].text {
                                                print("rental Income: \(rentalIncome)")
                                                self.mortgageInfo?.income = Int(rentalIncome)!
                                                self.showAlert()
                                            }
            print("here in here")
        }
        actionSheet.addAction(continueAction)

        
        self.present(actionSheet, animated: true);
    }
    
    func isPrimary(){
        mortgageInfo?.isInvestment = false;
        mortgageInfo?.managementFees = 0;
        mortgageInfo?.miscFees = 0;
        
        managementFeesCash.isEnabled = false;
        managementFeesPercent.isEnabled = false;
        miscVacancyFeesCash.isEnabled = false;
        miscVacancyFeesPerecent.isEnabled = false;
        
    }
    
    func isInvestment(){
        mortgageInfo?.isInvestment = true;
        mortgageInfo?.managementFees = Int(managementFeesCash.text!) ?? 0
        mortgageInfo?.miscFees = Int(miscVacancyFeesCash.text!) ?? 0
        
        managementFeesCash.isEnabled = true;
        managementFeesPercent.isEnabled = true;
        miscVacancyFeesCash.isEnabled = true;
        miscVacancyFeesPerecent.isEnabled = true;
    }

    @IBAction func isPrimaryorRentalPressed(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            isPrimary();
        }
        else{
            isInvestment();
        }
    }
    
    @IBAction func propertyTaxCashEntered(_ sender: Any) {

        let price = Double(propPrice);
        guard let pt = Double(propertyTaxesCash.text ?? ""), pt > 0 else {
               // alert that you can't have negative or zero games or that the entered text did not convert to a number
            print("I")
               return
           }
        
           let percentPt = pt/price
        propertyTaxesPercent.text = "\(percentPt * 100)"
    }
    
    @IBAction func propertyTaxPercentEntered(_ sender: Any) {
        let price = Double(propPrice);

        guard let pt = Double(propertyTaxesPercent.text ?? ""), pt > 0 else {
               // alert that you can't have negative or zero games or that the entered text did not convert to a number
               return
        }
     print(pt)
        let cashAmount = Int((pt / 100) * price)
     propertyTaxesCash.text = "\(cashAmount)"
    }
    
    
    
    @IBAction func managementCashEntered(_ sender: Any) {
        let price = Double(propPrice);

        guard let mf = Double(managementFeesCash.text ?? ""), mf > 0 else {
               // alert that you can't have negative or zero games or that the entered text did not convert to a number
               return
           }
        
           let percentPt = mf/price
        managementFeesPercent.text = "\(percentPt * 100)"
    }
    
    @IBAction func managementPercentEntered(_ sender: Any) {
        let price = Double(propPrice);
        guard let pt = Double(managementFeesPercent.text ?? ""), pt > 0 else {
               // alert that you can't have negative or zero games or that the entered text did not convert to a number
               return
        }
        let cashAmount = Int((pt / 100) * price)
     managementFeesCash.text = "\(cashAmount)"
    }
    
    @IBAction func miscVacancyCashEntered(_ sender: Any) {
        let price = Double(propPrice);

        guard let mf = Double(miscVacancyFeesCash.text ?? ""), mf > 0 else {
               // alert that you can't have negative or zero games or that the entered text did not convert to a number
               return
           }
        
           let percentPt = mf/price
        miscVacancyFeesPerecent.text = "\(percentPt * 100)"
    }
    
    @IBAction func miscVacancyPercentEntered(_ sender: Any) {
        let price = Double(propPrice);

        guard let pt = Double(miscVacancyFeesPerecent.text ?? ""), pt > 0 else {
               // alert that you can't have negative or zero games or that the entered text did not convert to a number
               return
        }
        let cashAmount = Int((pt / 100) * price)
     miscVacancyFeesCash.text = "\(cashAmount)"
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        mortgageInfo?.propTaxes = Int(propertyTaxesCash.text ?? "0")!;
        mortgageInfo?.insuranceFees = Int(insuranceAmount.text ?? "0")!;
        
        if((mortgageInfo?.isInvestment) != false){
            mortgageInfo?.miscFees = Int(miscVacancyFeesCash.text ?? "0")!;
            mortgageInfo?.managementFees = Int(managementFeesCash.text ?? "0")!;
            showActionSheet()
            self.performSegue(withIdentifier: "goToFinal", sender: self)
        
        }

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        // Create a variable to store the name the user entered on textField
            
        // Create a new variable to store the instance of the SecondViewController
        // set the variable from the SecondViewController that will receive the data
        let destinationVC = segue.destination as! resultsPage
        destinationVC.mortgageInfo = mortgageInfo;
    }
}
