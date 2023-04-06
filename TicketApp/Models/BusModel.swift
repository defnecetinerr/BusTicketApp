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
    var price: String?
    var companyImg: String?
    var time: String?
    
    init() {
        
    }
    init(tickedId: Int, companyImg: String, price: String?, time: String? ) {
        self.ticketId = tickedId
        self.companyImg = companyImg
        self.price = price
        self.time = time
    }
}
