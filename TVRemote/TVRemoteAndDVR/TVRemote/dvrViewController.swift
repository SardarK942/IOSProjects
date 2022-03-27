//
//  dvrViewController.swift
//  TVRemote
//
//  Created by Sardar Khan on 2/19/22.
//

import UIKit

class dvrViewController: UIViewController {

    @IBOutlet weak var Power: UILabel!
    @IBOutlet weak var currentState: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Okay!", message: "We went ahead and stopped the current opertation and pushed your request", preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in
        } ))
        present(alert, animated: true);
    }
    
    func showActionSheet(_ sender: String){
        let actionSheet = UIAlertController(title: "Woah, this is an Illegal Request", message: "Would you like to force your request?", preferredStyle: .actionSheet);
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("canceled")
        }));
        
        actionSheet.addAction(UIAlertAction(title: "Push Request", style: .default, handler: { action in
            self.currentState.text = sender;
            self.showAlert();
        }));
        
        present(actionSheet, animated: true);
    }
    

    @IBAction func PowerSwitch(_ sender: UISwitch) {
        if (sender.isOn){
            Power.text = "ON";
            currentState.text = "Stopped"
        }
        else {
            Power.text = "OFF";
            currentState.text = "";
        }
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        if(Power.text == "ON"){
            currentState.text = "Stopped";
        }
    }
    
    @IBAction func pausePlayButton(_ sender: Any) {
        if(Power.text == "ON" && (currentState.text == "Forwarding" || currentState.text == "Rewinding" || currentState.text == "Paused" || currentState.text == "Stopped")){
            currentState.text = "Playing";
        }
    
        
    else if(Power.text == "ON" && (currentState.text == "Playing")){
            currentState.text = "Paused";
        }
        
    else if(Power.text == "ON"){
                showActionSheet("Playing");
            }
    }
    
     @IBAction func rewind(_ sender: Any) {
         if(Power.text == "ON" && currentState.text == "Playing"){
             currentState.text = "Rewinding";
         }
         else if(Power.text == "ON"){
                 showActionSheet("Rewinding");
             }
     }
    
     @IBAction func fastForward(_ sender: Any) {
         if(Power.text == "ON" && currentState.text != "Playing"){
             currentState.text = "Forwarding";
         }
         else if(Power.text == "ON"){
                 showActionSheet("Forwarding");
             }
     }
    
    @IBAction func recordButton(_ sender: Any) {
        if(Power.text == "ON" && currentState.text == "Stopped"){
            currentState.text = "Recording";
        }
        else if(Power.text == "ON"){
                showActionSheet("Recording");
            }
    }
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
