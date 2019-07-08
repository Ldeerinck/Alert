//
//  ViewController.swift
//  Alert
//
//  Created by Luke Deerinck on 6/20/19.
//  Copyright © 2019 Luke Deerinck. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    var eventHub:Events = Events()
    var index:Int = 0
    @IBOutlet var summaryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        eventHub.sort()
        summaryTable.reloadData()
    }
    
    func testData() {
        let currDate = Date();
        var temp = Event(description: "run 10k", date: currDate, type: .repeatDays, duration: 5, picture: nil)
        events.append(temp)
         temp = Event(description: "Sleep", date: currDate, type: .repeatDays, duration: 5, picture: nil)
        events.append(temp)
         temp = Event(description: "Program", date: currDate, type: .repeatDays, duration: 5, picture: nil)
        events.append(temp)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count //events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCard", for: indexPath)
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = "\(events[indexPath.row].timeUntil)"
        }
        if let label = cell.viewWithTag(2) as? UILabel {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            //dateFormatter.locale = Locale(identifier: "en_US")
            label.text = dateFormatter.string(from: events[indexPath.row].date)
        }
        if let label = cell.viewWithTag(3) as? UILabel {
            label.text = "\(events[indexPath.row].description)"
        }
        let imageView = UIImageView(image: events[indexPath.row].picture)
        cell.backgroundView = imageView
        cell.backgroundView?.contentMode = .scaleAspectFill
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is EventViewController
        {
            let vc = segue.destination as? EventViewController
            vc?.index = self.index
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "eventClicked", sender: self)
    }
}

