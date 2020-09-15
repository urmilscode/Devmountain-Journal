//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Urmil Shah on 9/15/20.
//  Copyright © 2020 Spark28 Apps. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    
    //Mark - Outlets
    
    var landingPad: Entry?
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    
    
    @IBOutlet weak var detailTextField: UITextField!
    
    
    
    //Mark - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    
    
    //Mark:- Actions
    
   
    @IBAction func clearText(_ sender: Any) {
        titleTextField.text = ""
        detailTextField.text = ""
    }
    
    
    @IBAction func saveText(_ sender: Any) {
        
        
        guard let text = detailTextField.text, !text.isEmpty,
            let title = titleTextField.text, !title.isEmpty else { return }
        
        if let entry = landingPad {
            EntryController.shared.updateEntry(newTitle: title, newText: text, entry: entry)
        } else {
            EntryController.shared.addEntry(title: title, text: text)
        }
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    //Mark:- Helper Methods


    func updateViews() {
        guard let entry = landingPad else {return}
        titleTextField.text = entry.title
        detailTextField.text = entry.text
    }
    
}



