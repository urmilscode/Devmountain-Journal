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
        saveToPersistentStore()
    }
    
    //Update entries
    
    func updateEntry(newTitle: String, newText: String, entry: Entry) {
        entry.text = newText
        entry.title = newTitle
        saveToPersistentStore()
    }
    
    //Delete Entries
    
    func deleteEntry(entry:Entry) {
        guard let index = entries.firstIndex(of: entry)
            else { return }
        entries.remove(at: index)
        saveToPersistentStore()
    }
    
    
    
    
    ///MARK:- Persistence
         func createPersistentStore() -> URL {
             let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
             let fileURL = urls[0].appendingPathComponent("Journal.json")
             return fileURL
         }
         
         func saveToPersistentStore() {
             do {
                 let data = try JSONEncoder().encode(entries)
                 try data.write(to: createPersistentStore())
             } catch   {
                 print("There was an error saving to the persistent store. \(error) - \(error.localizedDescription)")
             }
         }
         
         func loadFromPersistentStore() {
             do {
                 let data = try Data(contentsOf: createPersistentStore())
                 let decodedQuotes = try JSONDecoder().decode([Entry].self, from: data)
                 entries = decodedQuotes
             } catch {
                 print("There was an error loading from the persistent store. \(error) - \(error.localizedDescription)")
             }
         }
    
    
    
}
