//
//  ObservationEventTableViewCell.swift
//  Field Survey
//
//  Created by Cameron Wandfluh on 4/5/18.
//  Copyright © 2018 Cameron Wandfluh. All rights reserved.
//

import UIKit

class ObservationEventTableViewCell: UITableViewCell {

    @IBOutlet weak var observationName: UILabel!
    @IBOutlet weak var observationDate: UILabel!
    @IBOutlet weak var observationImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
