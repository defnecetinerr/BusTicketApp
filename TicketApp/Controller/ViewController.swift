//
//  ViewController.swift
//  TicketApp
//
//  Created by Defne Çetiner on 1.04.2023.
//

import UIKit
import DropDown
import SCLAlertView

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    
    let dropDownFrom = DropDown()
    let dropDownTo = DropDown()
    var datePicker = UIDatePicker()
   
    override func viewDidLoad() {
        super.viewDidLoad()
      createDatePicker()
    }
    func createToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        return toolbar
    }
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        dateTextField.textAlignment = .center
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = createToolBar()
    }
    
   @objc func donePressed() {
       let dateFormatter = DateFormatter()
       dateFormatter.dateStyle = .medium
       dateFormatter.timeStyle = .none
       self.dateTextField.text = dateFormatter.string(from: datePicker.date)
       self.view.endEditing(true)
    }
    
    @IBAction func fromButtonClicked(_ sender: UIButton) {
        dropDownFrom.dataSource = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"]
        
        dropDownFrom.anchorView = sender as? AnchorView
        dropDownFrom.bottomOffset = CGPoint(x: 0, y: (sender as AnyObject).frame.size.height)
        dropDownFrom.show()
        dropDownFrom.selectionAction = { [weak self] (index: Int, item: String) in
        guard let _ = self else { return }
        (sender as AnyObject).setTitle(item, for: .normal)
            }
        }
        
        @IBAction func toButtonClicked(_ sender: UIButton) {
            dropDownTo.dataSource = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"]
            dropDownTo.anchorView = sender
            dropDownTo.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
            dropDownTo.show()
            dropDownTo.selectionAction = { [weak self] (index: Int, item: String) in
            guard let _ = self else { return }
            (sender as AnyObject).setTitle(item, for: .normal)
                }
        }
    

         @IBAction func getTicketActionButton(_ sender: Any) {
           func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
               if fromButtonClicked == nil || toButtonClicked == nil || dateTextField.text == "" {
                   SCLAlertView().showError("Rota seçimini yapmadınız!", subTitle: "Lütfen gerekli alanları doldurarak rotanızı planlayınız")
                   return false
               } else if dropDownFrom.selectedItem == dropDownTo.selectedItem{
                   SCLAlertView().showError("Hatalı Rota Seçimi", subTitle: "Rota noktalarınızı aynı seçtiniz. Lütfen doğru rotayı belirlediğinizden emin olun!")
                   return false
               } else { return true }
               
            }

        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "toTicketList" {
            if let destinationVC = segue.destination as? TicketListViewController {
                destinationVC.infoDateTextValue = dateTextField.text!
                destinationVC.cityText = (dropDownFrom.selectedItem ?? "error") + dropDownTo.selectedItem!
                
            }
        }
    }
    }
    

