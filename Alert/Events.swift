//
//  Events.swift
//  Alert
//
//  Created by Luke Deerinck on 6/20/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation

class Events {
    func sort() {
        events = events.sorted {$0.timeUntil < $1.timeUntil}
    }

    func addItem(event: Event) {
        events.append(event)
        sort()
    }

    func deleteItem(index: Int) {
        events.remove(at: index)
    }

    func updateItem() {
        
    }

    func export() {
        
    }

    func readFromFile() {
        
    }

    func writeToFile() {
        
    }
}
