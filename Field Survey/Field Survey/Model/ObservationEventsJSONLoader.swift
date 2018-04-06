//
//  ObservationEventJSONLoader.swift
//  Field Survey
//
//  Created by Cameron Wandfluh on 4/5/18.
//  Copyright © 2018 Cameron Wandfluh. All rights reserved.
//

import Foundation

class ObservationEventsJSONLoader {
    
    class func load(fileName: String) -> [ObservationEvent] {
        var observationEvents = [ObservationEvent]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            observationEvents = ObservationEventsJSONParser.parse(data)
        }
        
        return observationEvents
    }
}
