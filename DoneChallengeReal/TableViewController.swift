//
//  TableViewController.swift
//  DoneChallengeReal
//
//  Created by Test on 16.03.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(myNib, forCellReuseIdentifier: "TableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        // Configure the cell...
      //  cell.textLabel?.text = "olmamali"
        cell.createCustomTableCell(animalNameID: indexPath.row)
        cell.animalIDTableCell = indexPath.row
        
        return cell
    }
    
}
