//
//  PropertyListScreen.swift
//  Khan_Sardar_masterDetailApp
//
//  Created by Sardar Khan on 3/10/22.
//

import UIKit

class PropertyListScreen: UIViewController, UITableViewDataSource, UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Investment Property List"
        table.dataSource = self;
        table.delegate = self;
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var table: UITableView!
    
    class Property {
        let title: String
        let imageName: String
        let purchasePrice: String
        let bedBaths: String
        let repairCosts: String
        let expectedProfit: String
        
        init(title:String, imageName:String, purchasePrice:String, bedBaths:String, repairCosts:String, expectedProfit:String){
            self.title = title;
            self.imageName = imageName;
            self.purchasePrice = purchasePrice
            self.bedBaths = bedBaths
            self.repairCosts = repairCosts
            self.expectedProfit = expectedProfit
        }
    }
    
    let data: [Property] = [
        Property(title: "9006 Maple Ct, Morton Grove IL 60053", imageName: "property1", purchasePrice: "$215,000", bedBaths: "5/2", repairCosts: "25,000", expectedProfit: "50,000"),
        Property(title: "9003 Maple Ct, Morton Grove IL 60053", imageName: "property2", purchasePrice: "$225,000", bedBaths: "6/2.5", repairCosts: "30,000", expectedProfit: "55,000"),
        Property(title: "9035 Maple Ct, Morton Grove IL 60053", imageName: "property3", purchasePrice: "$237,000", bedBaths: "6/3", repairCosts: "20,000", expectedProfit: "35,000"),
        Property(title: "9236 Maple Ct, Morton Grove IL 60053", imageName: "property4", purchasePrice: "$190,000", bedBaths: "4/2", repairCosts: "15,000", expectedProfit: "30,000")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        let property = data[indexPath.row]
        
//        self.table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PropertyCell
        cell.propertyAddressLabel.text = property.title;
        cell.propertyImageVIew.image = UIImage(named: property.imageName);
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140; 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PropertyDetailsViewController{
            destination.property = data[(table.indexPathForSelectedRow?.row)!]
            
            table.deselectRow(at: table.indexPathForSelectedRow!, animated: true)

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
