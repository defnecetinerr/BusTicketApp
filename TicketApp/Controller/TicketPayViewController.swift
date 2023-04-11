//
//  TicketPayViewController.swift
//  TicketApp
//
//  Created by Defne Çetiner on 10.04.2023.
//

import UIKit
import SCLAlertView
import Lottie

class TicketPayViewController: UIViewController {

    @IBOutlet weak var infoSeatNumber: UILabel!
    @IBOutlet weak var infoCityFromLabel: UILabel!
    @IBOutlet weak var infoCompanyImage: UIImageView!
    @IBOutlet weak var companyImageInfo: UIImageView!
    @IBOutlet weak var infoDate: UILabel!
    @IBOutlet weak var identificationNumberTextField: UITextField!
    @IBOutlet weak var infoToCityLabel: UILabel!
    @IBOutlet weak var nameSurnameTextField: UITextField!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!

    
    var seatNumberTextValue = ""
    var dateTextValue = ""
    let animationView = LottieAnimationView.self
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoSeatNumber.text = seatNumberTextValue
        infoCityFromLabel.text = TicketListViewController.cityText
        infoToCityLabel.text = TicketListViewController.toCityText
        infoDate.text = TicketListViewController.infoDateTextValue
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        if nameSurnameTextField.text == "" || identificationNumberTextField.text == "" || cardNumberTextField.text == "" || monthTextField.text == "" || cvvTextField.text == "" {
            
            SCLAlertView().showError("UYARI", subTitle: "Lütfen gerekli alanların doldurulduğundan emin olun.", closeButtonTitle: "Tamam")
        }else {
            performSegue(withIdentifier: "confirmVC", sender: nil)
            
        }
    }
    }
    
  

