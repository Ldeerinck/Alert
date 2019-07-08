//
//  EventViewController.swift
//  Alert
//
//  Created by Luke Deerinck on 6/23/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import UIKit

class EventViewController: UITableViewController, UIPickerViewDelegate {
    
    var index:Int = 0
    var shouldBeHidden:Bool = true
    var dPicker:UIDatePicker!
    lazy var recurrenceDataSource = RecurrenceType(events[index])
    lazy var textDelegate = TextViewDelegate(events[index])
    @IBOutlet var eventTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTableView.backgroundView = UIImageView(image: events[index].picture)
        eventTableView.tableFooterView = UIView(frame: CGRect.zero)
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 45
        case 1: if shouldBeHidden {return 0} else {return 95}
        case 2: return 200
        case 3: return 95
        default: return 45
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            shouldBeHidden.toggle()
            let pickerPath = IndexPath(row:1,section:0)
            tableView.reloadRows(at: [pickerPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "dateDisplay", for: indexPath)
            if let label = cell.viewWithTag(1) as? UILabel {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                dateFormatter.timeStyle = .none
                label.text = dateFormatter.string(from: events[index].date)
            }
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            if let label = cell.viewWithTag(2) as? UIDatePicker {
                label.date = events[index].date
                dPicker = label
            }
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "description cell", for: indexPath)
            if let label = cell.viewWithTag(3) as? UITextView {
                label.text = events[index].description
                label.delegate = textDelegate
                
            }
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "picker cell", for: indexPath)
            if let label = cell.viewWithTag(5) as? UIPickerView {
                label.dataSource = recurrenceDataSource
                label.delegate = recurrenceDataSource
            }
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "picture cell", for: indexPath)
        }
        return cell
    }
    
    @IBAction func datedidChange(_ sender: Any) {
        events[index].date = dPicker.date
        let pickerPath = IndexPath(row:0,section:0)
        tableView.reloadRows(at: [pickerPath], with: .automatic)
    }
    
}
