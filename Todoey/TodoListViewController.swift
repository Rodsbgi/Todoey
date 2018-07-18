//
//  ViewController.swift
//  Todoey
//
//  Created by user on 15/07/2018.
//  Copyright © 2018 rodrigo. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = ["Find Mike","Buy eggs", "Destroy"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            //print(cell.textLabel?.text ?? "")
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
            }else{
                cell.accessoryType = .checkmark
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    //MARK: - Methods
    @IBAction func buttonItemPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let actionNew = UIAlertAction(title: "Add new item", style: .default) { (action) in
            if let text = alert.textFields?[0].text, text != "" {
                
                self.itemArray.append(text)
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [IndexPath(row: self.itemArray.count - 1, section: 0)], with: .automatic)
                self.tableView.endUpdates()
            }
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
        }
        alert.addAction(actionNew)
        present(alert, animated: true, completion: nil)
        
    }
}







