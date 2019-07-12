//
//  textViewDelegate.swift
//  Alert
//
//  Created by Luke Deerinck on 7/6/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import Foundation
import UIKit
class TextViewDelegate: NSObject, UITextViewDelegate {
    var event:Event

    init(_ event: Event) {
        self.event = event
    }
    func textViewDidChange(_ textView: UITextView) {
        event.description = textView.text
    }
}
