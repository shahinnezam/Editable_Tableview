//
//  FoodUITableViewController.swift
//  Editable_Tableview
//
//  Created by Student Account on 10/3/22.
//

import Foundation
import UIKit


class FoodUITableViewController: UITableViewController {
    
    var nameOfDatastoreVariable : FoodList!
    
    @IBAction func addAThingee() {
        let myNewFood = Food(type: "Unknown", name: "New Food" + String(self.nameOfDatastoreVariable.listofFood.count))
        self.nameOfDatastoreVariable.add(grub: myNewFood)
        
        let numRows = self.nameOfDatastoreVariable.listofFood.count
        
        tableView.insertRows(at: [IndexPath(row: numRows - 1, section: 0)], with: .automatic)
    }

    @IBAction func toggleEditMode(_ sender: UIButton) {
        if isEditing {
                    setEditing(false, animated: true)
                    sender.setTitle("Edit", for: .normal)
                }
        else {
                    setEditing(true, animated: true)
                    sender.setTitle("Done", for: .normal)
                }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameOfDatastoreVariable.listofFood.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //tableView.isEditing - if need to use internally
        let cell = tableView.dequeueReusableCell( withIdentifier: "MyTableCell", for: indexPath)
        let bestFood = self.nameOfDatastoreVariable.listofFood[indexPath.row]
        cell.textLabel!.text = bestFood.name
        cell.detailTextLabel?.text = bestFood.type
        
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if( editingStyle == .delete) {
             nameOfDatastoreVariable.remove(atIndex: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
}

