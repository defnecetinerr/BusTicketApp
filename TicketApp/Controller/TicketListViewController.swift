//
//  TicketListViewController.swift
//  TicketApp
//
//  Created by Defne Çetiner on 4.04.2023.
//

import UIKit
import SCLAlertView

class TicketListViewController: UIViewController {
    
    @IBOutlet private weak var ticketListTableView: UITableView!
    var cityText = ""
    var toCityText = ""
    var infoDateTextValue = ""
    var busList = [BusModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ticketListTableView.dataSource = self
        ticketListTableView.delegate = self
        
        let firtTicket = BusModel(tickedId: 1234, companyImg: "kamilkoc", price: "550", time: "14:30")
        let secondTicket = BusModel(tickedId: 2345, companyImg: "nilufer", price: "500",time: "15.00")
        let thirdTicket = BusModel(tickedId: 3456, companyImg: "metro", price: "500",time: "15.00")
        let fourthTicket = BusModel(tickedId: 4567, companyImg: "anadolu", price: "550",time: "16.30")
        let fifthTicket = BusModel(tickedId: 5678, companyImg: "izmir", price: "600",time: "20.30")
        let sixthTicket = BusModel(tickedId: 6789, companyImg: "varan", price: "450",time: "23.00")
        let seventhTicket = BusModel(tickedId: 7890, companyImg: "topcam", price: "480",time: "21.00")
        let eighthTicket = BusModel(tickedId: 8901, companyImg: "aliOsmanUlusoy", price: "530",time: "20:00")
        
        busList.append(firtTicket)
        busList.append(secondTicket)
        busList.append(thirdTicket)
        busList.append(fourthTicket)
        busList.append(fifthTicket)
        busList.append(sixthTicket)
        busList.append(seventhTicket)
        busList.append(eighthTicket)
        
    }
    
    @IBAction func goBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension TicketListViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return busList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ticketValue = busList[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ticketListViewCell", for: indexPath) as? TicketListTableViewCell else { return UITableViewCell() }
        cell.fromCityLabel.text = cityText
        cell.toCityLabel.text = toCityText
        cell.priceLabel.text = ticketValue.price
        cell.timeLabel.text = ticketValue.time
        cell.companyImage.image = UIImage(named: ticketValue.companyImg!)
        cell.indexPath = indexPath
        return cell
    }
    
}
