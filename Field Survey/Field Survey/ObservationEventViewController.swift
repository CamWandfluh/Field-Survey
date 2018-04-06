//
//  ObservationEventViewController.swift
//  Field Survey
//
//  Created by Cameron Wandfluh on 4/5/18.
//  Copyright © 2018 Cameron Wandfluh. All rights reserved.
//

import UIKit

class ObservationEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var observationTableView: UITableView!
    let observationEvents = ObservationEventsJSONLoader.load(fileName: "field_observations")
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return observationEvents.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ObservationEventCell", for: indexPath)
        
        if let cell = cell as? ObservationEventTableViewCell {
            let event = observationEvents[indexPath.row]
            cell.observationImage.image = event.classification.image
            cell.observationName.text = event.title
            cell.observationDate.text = dateFormatter.string(from: event.date)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ObservationDetailViewController,
            let row = observationTableView.indexPathForSelectedRow?.row {
            destination.observationEvent = observationEvents[row]
        }
    }
}
