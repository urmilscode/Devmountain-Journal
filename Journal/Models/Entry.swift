//
//  Entry.swift
//  Journal
//
//  Created by Urmil Shah on 9/15/20.
//  Copyright © 2020 Spark28 Apps. All rights reserved.
//

import Foundation

class Entry: Codable {
    var title: String
    var text: String
    var timeStamp: Date
    
    init(title:String, text:String, timeStamp:Date = Date()) {
        self.title = title
        self.text = text
        self.timeStamp = timeStamp
    }
}


extension Entry: Equatable {
    static func == (lhs: Entry, rhs:Entry) -> Bool {
        return lhs.text == rhs.text &&
            lhs.title == rhs.title &&
            lhs.timeStamp == rhs.timeStamp
    }
}
