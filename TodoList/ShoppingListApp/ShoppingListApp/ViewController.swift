//
//  ViewController.swift
//  ShoppingListApp
//
//  Created by Sardar Khan on 2/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   

    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        return table
    }()

    var items = [String]()
    var RefreshClicked = false;

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
        self.RefreshClicked = UserDefaults.standard.bool(forKey: "RefreshClicked")
        title = "Shopping List"
        view.addSubview(table)
        table.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapNewList))
    }
    
    @objc private func didTapNewList(){
        self.items = [];
        self.table.reloadData();
        
    }
        
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Enter new shopping list item", preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = "Enter item bro"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil));
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] (_) in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    //Enter new shopping list item
                    print(text);
                    
                    DispatchQueue.main.async {
                        self?.items.append(text);
                        self?.table.reloadData()
                    }
                   
                }
            }
            
        }));
        
        present(alert, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    


}

