//
//  Event.swift
//  Alert
//
//  Created by Luke Deerinck on 6/20/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation
import UIKit
enum Recurrence {
    case repeatDays
    case repeatWeeks
    case repeatMonths
    case repeatYears
}
class Event {
    var description:String
    var date:Date
    var type:Recurrence
    var repDuration:Int
    var picture: UIImage
    var timeUntil: TimeInterval {
        return (date.timeIntervalSinceNow / (60*60*24)).rounded(.up)
    }
    
    init(description: String, date: Date, type: Recurrence?, duration:Int?, picture: UIImage?) {
        self.description = description
        self.date = date
        self.type = type ?? .repeatDays
        self.repDuration = duration ?? 1
        self.picture = picture ?? UIImage(named: "Gradient.png")!
    }
    
    func calcNewDate() { //calculates the new alert date for the event
        
    }
}
