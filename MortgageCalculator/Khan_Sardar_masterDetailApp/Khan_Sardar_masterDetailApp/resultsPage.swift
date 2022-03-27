//
//  resultsPage.swift
//  Khan_Sardar_masterDetailApp
//
//  Created by Sardar Khan on 3/18/22.
//

import Foundation
import UIKit
import AVFoundation
import MessageUI

class resultsPage: UIViewController, AVAudioPlayerDelegate, MFMessageComposeViewControllerDelegate{

    
    
    var phoneNumber: String?
    
    
    @IBOutlet weak var totalMonthlyPayment: UILabel!
    
    
    @IBOutlet weak var principalandInterest: UILabel!
    
    @IBOutlet weak var cashFlow: UILabel!
    
    var mortgageInfo: MortgageCalcFirst.MortgageClass?;

    var player: AVAudioPlayer?
    var soundFileURLRef: NSURL!


    func playSound() {
        let cashSound = Bundle.main.url(forResource: "chaChing", withExtension: "mp3")
        self.soundFileURLRef = cashSound as NSURL?;
        do {
            player = try AVAudioPlayer(contentsOf: soundFileURLRef as URL) }
        catch _ {
            player = nil }
        
            player?.delegate = self
            player?.prepareToPlay();
            player?.play();
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalMonthlyPayment.text = "\(calculateTotalPayment(mortgageInfo))";
        principalandInterest.text = "\(String(describing: mortgageInfo!.officialMortgageAmt))";

        cashFlow.text = "\(Int(mortgageInfo?.income ?? 0) - (Int((totalMonthlyPayment?.text!)!) ?? 0))"
        
        
        playSound();
    }
    
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        
        if (MFMessageComposeViewController.canSendText()) {
                   let controller = MFMessageComposeViewController()
            controller.body = "Monthly Payment: " + totalMonthlyPayment.text! + "\nPrincipal and Interest: " + principalandInterest.text! + "\nExpected Cash Flow: " + cashFlow.text!; 
                   controller.recipients = ([self.phoneNumber] as! [String])
                   controller.messageComposeDelegate = self
                self.present(controller, animated: true, completion: nil)
               }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }

    
    
    
    func calculateTotalPayment(_ mortgageParam: MortgageCalcFirst.MortgageClass?) -> Int{
        
        var ansPt1 = mortgageParam!.officialMortgageAmt + Int(mortgageParam!.propTaxes / 12) +
        Int(mortgageParam!.miscFees / 12)
            
        var anspt2 = ansPt1 + Int(mortgageParam!.insuranceFees / 12) +
        Int(mortgageParam!.managementFees / 12);
            
        return anspt2;
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
    }
    
}
