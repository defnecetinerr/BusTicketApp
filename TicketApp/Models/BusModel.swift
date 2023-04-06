//
//  BusModel.swift
//  TicketApp
//
//  Created by Defne Çetiner on 4.04.2023.
//

import Foundation
import UIKit

class BusModel {
    var ticketId: Int?
    var cityFrom: String?
    var cityTo: String?
    var date: Int?
    var campanyName: String?
    var price: Int?
    
    init() {
        
    }
    init(tickedId: Int, cityFrom: String, cityTo: String, date: Int, campanyName: String, price: Int? ) {
        self.cityFrom = cityFrom
        self.cityTo = cityTo
        self.ticketId = tickedId
        self.date = date
        self.campanyName = campanyName
        self.price = price
    }
}
