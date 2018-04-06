//
//  ObservationEventsJSONParser.swift
//  Field Survey
//
//  Created by Cameron Wandfluh on 4/5/18.
//  Copyright © 2018 Cameron Wandfluh. All rights reserved.
//

import Foundation

class ObservationEventsJSONParser {
    
    static let dateFormatter = DateFormatter()
        
    class func parse(_ data: Data) -> [ObservationEvent] {
        var observationEvents = [ObservationEvent]()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            
            if let events = root["observations"] as? [Any] {
                for event in events {
                    if let event = event as? [String: String] {
                        if let classificationName = event["classification"],
                            let title = event["title"],
                            let description = event["description"],
                            let dateString = event["date"],
                            let date = dateFormatter.date(from: dateString) {
                            
                            if let observationEvent = ObservationEvent(classificationName: classificationName, title: title, description: description, date: date){
                                observationEvents.append(observationEvent)
                            }
                        }
                    }
                }
            }
        }
        
       return observationEvents
    }
}
