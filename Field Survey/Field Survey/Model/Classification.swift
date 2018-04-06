//
//  Observation.swift
//  Field Survey
//
//  Created by Cameron Wandfluh on 4/5/18.
//  Copyright © 2018 Cameron Wandfluh. All rights reserved.
//

import UIKit

enum Classification: String {
    case mammal
    case insect
    case fish
    case bird
    case reptile
    case plant
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}
