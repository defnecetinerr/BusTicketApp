//
//  TicketListViewController.swift
//  TicketApp
//
//  Created by Defne Çetiner on 4.04.2023.
//

import UIKit
import SCLAlertView

class TicketListViewController: UIViewController {

    @IBOutlet weak var ticketListTableView: UITableView!
    var cityText = ""
    var infoDateTextValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        ticketListTableView.dataSource = self
        ticketListTableView.delegate = self
       
    }
    


}

extension TicketListViewController: UITableViewDelegate,UITableViewDataSource{
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return infoDateTextValue.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoDateTextValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketListViewCell", for: indexPath)
        return cell
        
    }
}
