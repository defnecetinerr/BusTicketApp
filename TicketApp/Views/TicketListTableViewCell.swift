//
//  TicketListTableViewCell.swift
//  TicketApp
//
//  Created by Defne Çetiner on 5.04.2023.
//

import UIKit

protocol TicketListTableViewCellProtocol {
    func chooseSeatButton(indexPath:IndexPath)
}
class TicketListTableViewCell: UITableViewCell {

    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var fromCityLabel: UILabel!
    @IBOutlet weak var toCityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var cellProtocol: TicketListTableViewCellProtocol?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    @IBAction func chooseSeatButton(_ sender: Any) {
        cellProtocol?.chooseSeatButton(indexPath: indexPath!)
    }
}
