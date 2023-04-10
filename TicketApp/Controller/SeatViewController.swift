//
//  SeatViewController.swift
//  TicketApp
//
//  Created by Defne Çetiner on 6.04.2023.
//

import UIKit
import SCLAlertView
import Lottie

class SeatViewController: UIViewController {
    
    @IBOutlet weak var leftSeatCollectionView: UICollectionView!
    @IBOutlet weak var rightCollectionView: UICollectionView!
    
    var selectedSeatsLeft = [Int]()
    var selectedSeatsRight = [Int]()
    
    var selectedSeatNumberString = ""
    var tempDateTextValue = ""
    var selectedSeatNumbers = [String]()
    
    var leftSeatNumbers = ["01", "02","05", "06", "09", "10", "13", "14","01", "02","05", "06", "09", "10", "13", "14",]
    var rightSeatNumbers = [ "03", "04",  "07", "08", "11", "12", "15", "16", "19", "20", "23", "24", "27", "28"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let leftWidth = self.leftSeatCollectionView.frame.size.width
        let rightWidth = self.leftSeatCollectionView.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 15, left: 3, bottom: 2, right: 30)
        let leftItemWidth = (leftWidth-10)/2
        let rightItemWidth = (rightWidth-10)/2
        design.minimumInteritemSpacing = 1
        design.minimumLineSpacing = 15
        design.itemSize = CGSize(width: 45, height: 45)
        leftSeatCollectionView!.collectionViewLayout = design
        rightCollectionView.collectionViewLayout = design
        
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedSeatNumberString = ""
    }
    private func configureCollectionView() {
        leftSeatCollectionView.delegate = self
        leftSeatCollectionView.dataSource = self
        rightCollectionView.delegate = self
        rightCollectionView.dataSource = self
    }
    
    
    @IBAction func goPay(_ sender: Any) {
       
    }
}
extension SeatViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.leftSeatCollectionView {
            return leftSeatNumbers.count
        } else {
            return rightSeatNumbers.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.leftSeatCollectionView {
            let leftCell = leftSeatCollectionView.dequeueReusableCell(withReuseIdentifier: "leftSeatView", for: indexPath) as! LeftSeatCell
            leftCell.layer.cornerRadius = 7
            leftCell.leftSeatLabel.text = leftSeatNumbers[indexPath.row]
            
            return leftCell
            
        } else {
            let rightCell = rightCollectionView.dequeueReusableCell(withReuseIdentifier: "rightSeatView", for: indexPath) as! RightSeatCell
            rightCell.layer.cornerRadius = 7
            rightCell.rightSeatLabel.text = rightSeatNumbers[indexPath.row]
            
            return rightCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        if collectionView == self.rightCollectionView {
            
            let selectedRightCell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
            let rightCell = collectionView.cellForItem(at: indexPath)
            
           var seatNumber = indexPath.row + 1
            if selectedSeatsRight.contains(indexPath.row+1) {
                if let index = selectedSeatsRight.firstIndex(of: indexPath.row+1) {
                    selectedSeatsRight.remove(at: index)
                }
                rightCell?.backgroundColor = UIColor.clear
            } else {
                if selectedSeatsRight.count < 5 {
                    selectedSeatsRight .append(indexPath.row+1)
                    rightCell?.backgroundColor = UIColor.orange
                }else{
                    
                    SCLAlertView().showError("UYARI", subTitle: "Lütfen 5 koltuktan az seçim yaptığınızdan emin olun.", closeButtonTitle: "Tamam")
                }
            }
            selectedSeatNumbers = selectedSeatNumbers.filter { $0 != rightSeatNumbers[indexPath.row]}
        } else {
            
            
            let selectedLeftCell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
            let leftCell = collectionView.cellForItem(at: indexPath)
            
            var seatNumber = indexPath.row + 1
            if selectedSeatsLeft .contains(indexPath.row+1) {
                if let index = selectedSeatsLeft .firstIndex(of: indexPath.row+1) {
                    selectedSeatsLeft.remove(at: index)
                }
                leftCell?.backgroundColor = UIColor.clear
            } else {
                if selectedSeatsLeft.count < 5 {
                    selectedSeatsLeft .append(indexPath.row+1)
                    leftCell?.backgroundColor = UIColor.orange
                }else{
                    
                    SCLAlertView().showError("UYARI", subTitle: "Lütfen 5 koltuktan az seçim yaptığınızdan emin olun.", closeButtonTitle: "Tamam")
                }
                
            }

            selectedSeatNumbers = selectedSeatNumbers.filter { $0 != leftSeatNumbers[indexPath.row]}
            
            
        }   
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if selectedSeatsLeft.count == 0 {
            SCLAlertView().showError("Koltuk Seçimi Yapmadınız", subTitle: "", closeButtonTitle: "Tamam")
            return false
        } else {
            return true
        }
        if selectedSeatsRight.count == 0 {
            SCLAlertView().showError("Koltuk Seçimi Yapmadınız", subTitle: "", closeButtonTitle: "Tamam")
            return false
        } else {
            return true
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goPayPage" {
            
            let destinationVC = segue.destination as? TicketPayViewController
    
            for i in 1...selectedSeatsLeft.count {
                selectedSeatNumberString = "Koltuk Numaranız:" + selectedSeatNumberString + "  " +  String(selectedSeatsLeft[i-1])
            }
            destinationVC?.seatNumberTextValue = selectedSeatNumberString
            destinationVC?.dateTextValue = tempDateTextValue
            
        }
    }

    
}




