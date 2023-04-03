//
//  ViewController.swift
//  TicketApp
//
//  Created by Defne Çetiner on 1.04.2023.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var toGoPickerView: UIPickerView!
    @IBOutlet weak var fromPickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
   
    var cityTitle: [CityModels] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
      cityTitle = [ CityModels(cityTitle: "İstanbul"),CityModels(cityTitle: "Ankara"),CityModels(cityTitle: "İzmir"),CityModels(cityTitle: "Bursa"),CityModels(cityTitle: "Antalya"),CityModels(cityTitle: "Konya"),CityModels(cityTitle: "Gaziantep"),CityModels(cityTitle: "Muğla"),CityModels(cityTitle: "Van"),CityModels(cityTitle: "Trabzon"),CityModels(cityTitle: "Sivas"),CityModels(cityTitle: "Erzurum")
      ]
    }

    
    @IBAction func getTicketActionButton(_ sender: Any) {
    }
    
}
extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource {
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return cityTitle.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return 1
    }
    
    
}
