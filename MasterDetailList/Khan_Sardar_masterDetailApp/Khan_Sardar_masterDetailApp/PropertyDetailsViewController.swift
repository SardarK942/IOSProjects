//
//  PropertyDetailsViewController.swift
//  Khan_Sardar_masterDetailApp
//
//  Created by Sardar Khan on 3/15/22.
//

import UIKit

class PropertyDetailsViewController: UIViewController {
    
        
        @IBOutlet weak var propertyImage: UIImageView!
        
        @IBOutlet weak var propertyAdressLabel: UILabel!
        
        @IBOutlet weak var purchasePriceLabel: UILabel!
        
        @IBOutlet weak var bedandBathsLabel: UILabel!
        
        @IBOutlet weak var costOfRepairsLabel: UILabel!
        
        @IBOutlet weak var expectedProfitLabel: UILabel!
        
    var property: PropertyListScreen.Property?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        propertyImage.image = UIImage(named: property!.imageName)
        
        propertyAdressLabel.text = property?.title;
        
        purchasePriceLabel.text = property?.purchasePrice;
        
        bedandBathsLabel.text = property?.bedBaths;
        
        costOfRepairsLabel.text = property?.repairCosts;
        
        expectedProfitLabel.text = property?.expectedProfit;
        
        // Do any additional setup after loading the view.
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
