//
//  Event.swift
//  Alert
//
//  Created by Luke Deerinck on 6/20/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation
import UIKit
enum RecurrenceType {
    case oneTime
    case repeatDays // repeates every X days
    case repeatMonths // repeates every X month on the Yth day
    case repeatYears // repeats every X years, on the Yth date
}
class Event {
    var description:String
    var date:Date
    var type:RecurrenceType
    var picture: UIImage
    var timeUntil: TimeInterval {
        return (date.timeIntervalSinceNow / (60*60*24)).rounded(.up)
    }
    
    init(description: String, date: Date, type: RecurrenceType, picture: UIImage?) {
        self.description = description
        self.date = date
        self.type = type
        self.picture = picture ?? UIImage(named: "Gradient.png")!
    }
    
    func calcNewDate(){ //calculates the new alert date for the event
        //test
    }
}
