//
//  configViewController.swift
//  TVRemote
//
//  Created by Sardar Khan on 3/4/22.
//

import SwiftUI

class configViewController: UIViewController{
    
    @IBOutlet weak var labelInserted: UITextField!
    
    @IBOutlet weak var segmentSelected: UISegmentedControl!
        
    @IBOutlet weak var channelNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func segmentPressed(_ sender: Any) {
        print(segmentSelected.selectedSegmentIndex);
    }
    
    @IBAction func clearAllData(_ sender: Any) {
        channelNum.text = "1";
        labelInserted.text = "";
        segmentSelected.selectedSegmentIndex = 0;
                
    }
    @IBAction func clickedSave(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "tvViewController" ) as! tvViewController
        
        controller.changeConfigIndex(channelName: labelInserted.text ?? "", channelNum: channelNum.text ?? "", index: segmentSelected.selectedSegmentIndex)
        
    }
    @IBAction func stepper(_ sender: UIStepper) {
        channelNum.text = "\(Int(sender.value))"
    }
}


