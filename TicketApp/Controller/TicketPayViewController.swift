//
//  TicketPayViewController.swift
//  TicketApp
//
//  Created by Defne Çetiner on 10.04.2023.
//

import UIKit

class TicketPayViewController: UIViewController {

    @IBOutlet weak var infoSeatNumber: UILabel!
    @IBOutlet weak var infoCityFromLabel: UILabel!
    @IBOutlet weak var infoCompanyImage: UIImageView!
   
    @IBOutlet weak var companyImageInfo: UIImageView!
    @IBOutlet weak var infoDate: UILabel!
    @IBOutlet weak var infoToCityLabel: UILabel!
    
//    var fromCityTextPay = ""
//    var toCityTextPay = ""
//    var infoDateTextValuePay = ""
//    var busList = [BusModel]()
//
    var seatNumberTextValue = ""
    var dateTextValue = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoSeatNumber.text = seatNumberTextValue
        infoCityFromLabel.text = TicketListViewController.cityText
        infoToCityLabel.text = TicketListViewController.toCityText
        infoDate.text = TicketListViewController.infoDateTextValue
    }
    

  
}
extension Notification.Name {
    static let moveData = Notification.Name("moveData")
}
