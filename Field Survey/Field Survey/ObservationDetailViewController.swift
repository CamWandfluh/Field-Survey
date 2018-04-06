//
//  ObservationDetailViewController.swift
//  Field Survey
//
//  Created by Cameron Wandfluh on 4/5/18.
//  Copyright © 2018 Cameron Wandfluh. All rights reserved.
//

import UIKit

class ObservationDetailViewController: UIViewController {

    var observationEvent: ObservationEvent?
    
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var classificationDate: UILabel!
    @IBOutlet weak var classificationName: UILabel!
    @IBOutlet weak var classificationImage: UIImageView!
    @IBOutlet weak var classificationDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short

        classificationImage.image = observationEvent?.classification.image
        classificationName.text = observationEvent?.title
        classificationDesc.text = observationEvent?.description
        if let date = observationEvent?.date {
            classificationDate.text = dateFormatter.string(from: date)
        } else {
            classificationDate.text = ""
        }
        
        self.title = observationEvent?.classification.rawValue
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
