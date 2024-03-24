//
//  OnboardingVC.swift
//  Harbilet
//
//  Created by Lale Huseyin on 20.03.2024.
//

import UIKit

class OnboardingVC: UIViewController {

    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var timer = Timer()
    var counter = 0
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                buttonChanged(last: true)
            }else {
                buttonChanged(last: false)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "Hemen Yola Çık!", description: "Hoş Geldiniz! Hayalinizdeki yolculuğa ilk adımı atmak için bize katılın. Otobüs biletinizi birkaç tıkla alın, yola çıkmanın keyfini çıkarın!" , image: "logo"),
            OnboardingSlide(title: "Koltuğunuzu Kolayca Ayırtın!", description: "Dilediğiniz ili seçin ve size en uygun otobüsleri görün." , image: "passenger"),
            OnboardingSlide(title: "İyi Yolculuklar Dileriz!", description: "Biletinizi hemen almak için tıklayın!" , image: "bus")
        ]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        backBtn.isHidden = true
        
        timer = Timer.scheduledTimer(timeInterval: 4.5, target: self, selector: #selector(changeSlide), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }
    @objc func changeSlide() {
        if counter < slides.count {
            let indexPath = IndexPath(item: counter, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
            buttonChanged(last: false)
            currentPage = counter
        
            counter += 1
            
            
            
        }else {
            buttonChanged(last: true)
        }
    }

    func buttonChanged(last: Bool){
        if last {
            nextBtn.setTitle("BAŞLA!", for: .normal)
            nextBtn.backgroundColor = .systemGreen
            backBtn.isHidden = false
            skipBtn.isHidden = true
        }else {
            nextBtn.setTitle("SONRA", for: .normal)
            nextBtn.backgroundColor = UIColor.systemGreen
            skipBtn.isHidden = false
            if currentPage == 0 {
                backBtn.isHidden = true
            }else {
                backBtn.isHidden = false
            }
        }
    }
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            print("next")
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeTabBar") as! UITabBarController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
            
        }else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
       
    }
    @IBAction func skipBtnClicked(_ sender: UIButton) {
        currentPage = slides.count - 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    @IBAction func backBtnClicked(_ sender: UIButton) {
        currentPage -= 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}
extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
        cell.setup(slides[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        counter = currentPage
        
    }
    
}
