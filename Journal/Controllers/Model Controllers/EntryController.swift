//
//  EntryController.swift
//  Journal
//
//  Created by Urmil Shah on 9/15/20.
//  Copyright © 2020 Spark28 Apps. All rights reserved.
//

import Foundation

class EntryController {
    //Source of truth
    var entries: [Entry] = []
    
    //Shared Instance
    
    static let shared = EntryController()
    
    
    //CRUD functions
    
    //Create Entries
    
    func addEntry(title:String,text:String) {
      let newEntry = Entry(title: title, text: text)
        entries.append(newEntry)
        //Save
    }
    
    //Update entries
    
    func updateEntry(newTitle: String, newText: String, entry: Entry) {
        entry.text = newText
        entry.title = newTitle
        //save
    }
    
    //Delete Entries
    
    func deleteEntry(entry:Entry) {
        guard let index = entries.firstIndex(of: entry)
            else { return }
        entries.remove(at: index)
        //save
    }
    
}
