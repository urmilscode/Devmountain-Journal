//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Urmil Shah on 9/15/20.
//  Copyright © 2020 Spark28 Apps. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(true)
      EntryController.shared.loadFromPersistentStore()
          tableView.reloadData()
      }
    
    

    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return EntryController.shared.entries.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        let entries = EntryController.shared.entries[indexPath.row]
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        cell.textLabel?.text = entries.text
        cell.detailTextLabel?.text = dateFormatter.string(from: entries.timeStamp)
        return cell
        
    }
  


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entryToDelete = EntryController.shared.entries[indexPath.row]
            EntryController.shared.deleteEntry(entry: entryToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    


    // MARK: - Navigation
    //IIDOO

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           //Identifier
        if segue.identifier == "toDetailVC" {
            //Index
            guard let indexPath = tableView.indexPathForSelectedRow,
            //Destination
                let destinationVC = segue.destination as? EntryDetailViewController else {
                    return
            }
            let entry = EntryController.shared.entries[indexPath.row]
            destinationVC.landingPad = entry
            
            
        }
      
    }
    

}
