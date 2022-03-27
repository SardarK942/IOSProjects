//
//  ViewController.swift
//  TVRemote
//
//  Created by Sardar Khan on 2/1/22.
//

import UIKit

 class tvViewController: UIViewController {

    @IBOutlet weak var isPowerOn: UILabel!
    @IBOutlet weak var volumeNum: UILabel!
    @IBOutlet weak var channelNum: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!

    @IBOutlet weak var mySegment: UISegmentedControl!
    @IBOutlet weak var mySlider: UISlider!
    
    var channelWorkings: String = "";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        channelNum.text = "10"
        channelWorkings = "";
        // Do any additional setup after loading the view.
    }
    
     
    func addToWorkings(value: String){
        channelWorkings = channelWorkings + value;
        channelNum.text = channelWorkings;
    }
    
 
    @IBAction func powerSwitch(_ sender: UISwitch) {
        if (sender.isOn){
            isPowerOn.text = "ON";
            mySlider.isEnabled = true;
            mySegment.isEnabled = true;
        }
        else {
            isPowerOn.text = "OFF";
            mySlider.isEnabled = false;
            mySegment.isEnabled = false;
        }
    }
    
    
    @IBAction func volumeChange(_ sender: UISlider) {
        let value = sender.value
        volumeNum.text = "\(value)"
        
    }
    
     static var firstSeg = "10";
     static var secondSeg = "20";
     static var thirdSeg = "30";
     static var fourthSeg = "40";
     
     func changeConfigIndex(channelName: String, channelNum: String, index: Int){
         
//        mySegment.setTitle(channelName, forSegmentAt: index);

         if(mySegment != nil){
             print("Inside IF statement")
         mySegment.setTitle(channelName, forSegmentAt: index);
         }
         
        if(index == 0){
            print("INSIDE 0")
            tvViewController.firstSeg = channelNum;
         }
         if(index == 1){
             print("INSIDE 1")
             tvViewController.secondSeg = channelNum;
         }
         if(index == 2){
             print("INSIDE 2")

             tvViewController.thirdSeg = channelNum;
             print(tvViewController.thirdSeg);
         }
         if(index == 3){
             print("INSIDE 3")
             tvViewController.fourthSeg = channelNum;
         }
        }
     
    
    @IBAction func FavChannelClick(_ sender: UISegmentedControl) {
            if(sender.selectedSegmentIndex == 0){
                channelNum.text = tvViewController.firstSeg;
                channelWorkings = ""
            }
            if(sender.selectedSegmentIndex == 1){
                channelNum.text = tvViewController.secondSeg;
                channelWorkings = ""
                
            }
            if(sender.selectedSegmentIndex == 2){
                print(tvViewController.thirdSeg);
                channelNum.text = tvViewController.thirdSeg;
                channelWorkings = ""
                
            }
            if(sender.selectedSegmentIndex == 3){
                channelNum.text = tvViewController.fourthSeg;
                channelWorkings = ""
                
            }
        }
    
    
    
    @IBAction func selectPush(_ sender: UIButton) {
        if(mySwitch.isOn){
            channelWorkings = ""}
        else {
            sender.isEnabled = false;
        }
        var value = Int(channelNum.text!) ?? 0
        if(value > 100){
            channelNum.text = "error"
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.channelNum.text = "1";
            }
        }
    }
    
    
    @IBAction func zeroPush(_ sender: Any) {
        if(mySwitch.isOn){
        addToWorkings(value: "0");
        }}
    
    @IBAction func onePush(_ sender: Any) {
        if(mySwitch.isOn){
        addToWorkings(value: "1");
        }
    }
    @IBAction func twoPush(_ sender: Any) {
        if(mySwitch.isOn){
        addToWorkings(value: "2");
        }
    }
    @IBAction func threePush(_ sender: Any) {
        if(mySwitch.isOn){
        addToWorkings(value: "3");

        }}
    @IBAction func fourPush(_ sender: Any) {
        if(mySwitch.isOn){
        addToWorkings(value: "4");

        }}
    @IBAction func fivePush(_ sender: Any) {
        if(mySwitch.isOn){
        addToWorkings(value: "5");

        }}
    @IBAction func sixPush(_ sender: Any) {
        if(mySwitch.isOn){
        addToWorkings(value: "6");
        }
    }
    @IBAction func sevenPush(_ sender: Any) {
        if(mySwitch.isOn){
        addToWorkings(value: "7");
        }

    }
    @IBAction func eightPush(_ sender: Any) {
        if(mySwitch.isOn){
        addToWorkings(value: "8");
        }
    }
    @IBAction func ninePush(_ sender: Any) {
        if(mySwitch.isOn){
        addToWorkings(value: "9");
        }
    }
    @IBAction func channelPlus(_ sender: Any) {
        if(mySwitch.isOn && channelNum.text != "99"){
        var value = Int(channelNum.text!) ?? 0    // Get the label value content, if an Int is expected
        value += 1            // add the specified value
        channelNum.text = "\(value)"
        }
    }

    
    @IBAction func channelMinus(_ sender: Any) {
        if(mySwitch.isOn && channelNum.text != "1"){
        var value = Int(channelNum.text!) ?? 0    // Get the label value content, if an Int is expected
        value -= 1            // add the specified value
        channelNum.text = "\(value)"
        }
    }
}

