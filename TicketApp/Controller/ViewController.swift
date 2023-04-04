//
//  ViewController.swift
//  TicketApp
//
//  Created by Defne Çetiner on 1.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toSelectTextField: UITextField!
    @IBOutlet weak var fromSelectTextField: UITextField!
    
   // var cityTitle: [CityModels] = []
    var city:[String] = [String]()
    var cityTo:[String] = [String]()
    var fromPickerView:UIPickerView?
    var toPickerView:UIPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var city = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"]
        
        var cityTo = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"]
        
    fromPickerView = UIPickerView()
    toPickerView = UIPickerView()
    
    fromPickerView?.dataSource = self
    fromPickerView?.delegate = self
            
    toPickerView?.dataSource = self
    toPickerView?.delegate = self
        
    fromSelectTextField.inputView = fromPickerView
    toSelectTextField.inputView = toPickerView

        
    fromPickerView?.tag = 1
    toPickerView?.tag = 2
        
        let toolbar = UIToolbar()
        toolbar.tintColor = UIColor.tintColor
        toolbar.sizeToFit()
        
        let okButton = UIBarButtonItem(title: "Ok", style: .plain, target: self, action: #selector(ViewController.okClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClicked))
        
        toolbar.setItems([cancelButton,spaceButton,okButton], animated: true)
        fromSelectTextField.inputAccessoryView = toolbar
        toSelectTextField.inputAccessoryView = toolbar
        
        
//
//      cityTitle = [ CityModels(cityTitle: "İstanbul"),CityModels(cityTitle: "Ankara"),CityModels(cityTitle: "İzmir"),CityModels(cityTitle: "Bursa"),CityModels(cityTitle: "Antalya"),CityModels(cityTitle: "Konya"),CityModels(cityTitle: "Gaziantep"),CityModels(cityTitle: "Muğla"),CityModels(cityTitle: "Van"),CityModels(cityTitle: "Trabzon"),CityModels(cityTitle: "Sivas"),CityModels(cityTitle: "Erzurum")
//      ]
        
           
    }

    
    @IBAction func getTicketActionButton(_ sender: Any) {
//        let controller = storyboard?.instantiateViewController(identifier: "getTicketClicked") as! UINavigationController
//                    controller.modalPresentationStyle = .fullScreen
//                    controller.modalTransitionStyle = .flipHorizontal
//                  //  UserDefaults.standard.hasOnboarded = true
//                    present(controller, animated: true, completion: nil)
    }
    
}
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return city.count
        case 2:
            return cityTo.count
        default: return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1: print("case 1")
            return city[row]
        case 2: print("case 2")
            return cityTo[row]
        default: return "Data not found"
            
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       fromSelectTextField.text = city[row]
    
    }
    
    @objc func okClicked(){
       fromSelectTextField.text = ""
       toSelectTextField.text = ""
       fromSelectTextField.placeholder = "Select City"
        toSelectTextField.placeholder = "Select City"
       view.endEditing(true)
        view.endEditing(true)
    }
    
    @objc func cancelClicked(){
         view.endEditing(true)
        view.endEditing(true)
    }
}
