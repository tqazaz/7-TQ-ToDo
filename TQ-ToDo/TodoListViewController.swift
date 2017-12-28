//
//  ViewController.swift
//  TQ-ToDo
//
//  Created by TQ on 12/21/17.
//  Copyright © 2017 TQ. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    
    var itemArray = ["find Tariq" , "Forget mobile" , "Dont go to gym"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - TableView DataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row + 1)
        
//        print(itemArray[indexPath.row])
        
        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - add new Item

    
    
    @IBAction func addToDo(_ sender: Any) {
        
       var myTODO = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add Item", style: .default) { (action) in
            // what will happen once the user click the add button
//            print(myTODO.text)
            self.itemArray.append(myTODO.text!)
            self.tableView.reloadData()
//             itemArray.append(myTODO.text ?? "new Item")
            
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Click new Item"
            
            myTODO = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert,animated: true,completion: nil)
        
    }
    

}

