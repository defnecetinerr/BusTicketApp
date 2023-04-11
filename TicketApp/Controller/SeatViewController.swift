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
    
    var selectedSeatIndexRight = [Int]()
    var selectedSeatIndexLeft = [Int]()
    
    var selectedSeatsLeftStr = [String]()
    var selectedSeatsRightStr = [String]()
    
    var selectedSeatNumberString = ""
    var total = ""
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
        if selectedSeatsRightStr.count + selectedSeatsLeftStr.count < 6 {
            performSegue(withIdentifier: "goPayPage", sender: nil)
        }else {
            SCLAlertView().showError("UYARI", subTitle: "Lütfen 5 koltuktan az seçim yaptığınızdan emin olun.", closeButtonTitle: "Tamam")
        }
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
            if selectedSeatIndexRight.contains(indexPath.item) {
                if let index = selectedSeatIndexRight.firstIndex(of: indexPath.item) {
                    selectedSeatIndexRight.remove(at: index)
                    selectedSeatsRightStr.remove(at: index)
                    rightCell?.backgroundColor = UIColor.systemGreen
                }
            } else {
                selectedSeatsRightStr.append(rightSeatNumbers[indexPath.item])
                selectedSeatIndexRight.append(indexPath.item)
                rightCell?.backgroundColor = UIColor.orange
            }
        } else {
            let selectedLeftCell: UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
            let leftCell = collectionView.cellForItem(at: indexPath)
            if selectedSeatIndexLeft.contains(indexPath.item) {
                if let index = selectedSeatIndexLeft.firstIndex(of: indexPath.item) {
                    selectedSeatIndexLeft.remove(at: index)
                    selectedSeatsLeftStr.remove(at: index)
                    leftCell?.backgroundColor = UIColor.systemGreen
                }
            } else {
                selectedSeatsLeftStr.append(leftSeatNumbers[indexPath.item])
                selectedSeatIndexRight.append(indexPath.item)
                leftCell?.backgroundColor = UIColor.orange
            }
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if selectedSeatsLeft.count == 0 && selectedSeatsRight.count == 0 {
            SCLAlertView().showError("Koltuk Seçimi Yapmadınız", subTitle: "", closeButtonTitle: "Tamam")
            return false
        } else {
            return true
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goPayPage" {
            
            let destinationVC = segue.destination as? TicketPayViewController
            if selectedSeatsLeft.count == 0 {
                print("hata")
            }else {
                for i in 1...selectedSeatsLeft.count {
                    selectedSeatNumberString = selectedSeatNumberString + "  " +  String(selectedSeatsLeft[i-1])
                }
            }
            
            var totalArray = selectedSeatsRightStr + selectedSeatsLeftStr
            let totalString = totalArray.joined(separator: ",")
            total = totalString
            destinationVC?.seatNumberTextValue = total
            destinationVC?.dateTextValue = tempDateTextValue
            
        }
    }
}




