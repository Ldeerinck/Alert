//
//  recurrenceType.swift
//  Alert
//
//  Created by Luke Deerinck on 7/7/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation
import UIKit

class RecurrenceType:NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var event:Event
    
    init(_ event: Event) {
        self.event = event
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 1
        case 1:
            return 40
        default:
            return 4
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "Repeat Every"
        case 1:
            return String(row+1)
        default:
            return ["Daily","Weekly","Monthly","Yearly"][row]
        }
    }
    
    func setUp() {
        
    }
    
    
}
