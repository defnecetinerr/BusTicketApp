//
//  OnboardingViewController.swift
//  TicketApp
//
//  Created by Defne Çetiner on 1.04.2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var NextButtonOutlet: UIButton!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
            didSet {
                pageControl.currentPage = currentPage
                if currentPage == slides.count - 1 {
                    NextButtonOutlet.setTitle("Get Started", for: .normal)
                } else {
                    NextButtonOutlet.setTitle("Next", for: .normal)
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
                    OnboardingSlide(title: "Traveling is so easy now", description: "Sit back and buy tickets with confidence and travel with confidence", image: #imageLiteral(resourceName: "BUS2")),
                    OnboardingSlide(title: "Your luggage is now free!", description: "It is possible to travel freely and safely with your luggage. Are you ready?", image: #imageLiteral(resourceName: "2")),
                    OnboardingSlide(title: "Let's fasten our belts!", description: "Now you are ready for your most comfortable journey. Have a good journey.", image: #imageLiteral(resourceName: "3"))
                ]
    }
    
   
    @IBAction func nextButtonAction(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "toGoVC") as! UINavigationController
                        controller.modalPresentationStyle = .fullScreen
                        controller.modalTransitionStyle = .flipHorizontal
                      //  UserDefaults.standard.hasOnboarded = true
                        present(controller, animated: true, completion: nil)
              }
        
             else {
                  currentPage += 1
                  let indexPath = IndexPath(item: currentPage, section: 0)
                  collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
              }
    }
    
}
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
            cell.setap(slides[indexPath.row])
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let width = scrollView.frame.width
            currentPage = Int(scrollView.contentOffset.x / width)
        }
    }
