//
//  SeatsVC.swift
//  Harbilet
//
//  Created by Lale Huseyin on 18.03.2024.
//

import UIKit

class SeatsVC: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var toCity: UILabel!
    @IBOutlet weak var fromCity: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var selectedSeatsCollectionView: UICollectionView!
    @IBOutlet weak var seatsCollectionView: UICollectionView!
   
    var bus: BusModel!
    var seats = [SeatModel]()
    var selectedSeats = [SeatModel]() // choosen seats
    
    var pathWayNumber = Int() //koridor numaraları
    var seatNumber = Int() // seat numbers
    
    var selectedSeatsNumber = [Int]() // 5 seats control
    var selected = false
    
    var selectedCell: SeatCell? //for changing cell inside
    var cellIndex = Int()
    
    var seatPrice = 0
    var totalPrice = 0
    var errorMode = Int()

    var isBooked = false {
        didSet{
            bookTheSeats()
        }
    }
    var gender = 0 {
        didSet {
            changeImage()
            reloadView()
            calculatePrice()
            selected = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date.text = bus?.date
        time.text = bus?.time
        toCity.text = bus?.cityTo
        fromCity.text = bus?.cityFrom
        seatPrice = bus?.price ?? 0
        companyName.text = bus.companyName
       
        
        //creatıng the seats
        pathWayNumber = 2
            seatNumber = 1  
            for i in 0...59
            {
                if i == pathWayNumber  && i != 52// if it s centre, values empty to dictionary
                {
                    seats.append(SeatModel(seatNumber: 0, image: UIImage(), isBooked: false, text: "", gender: 0, isSelected: false))
                    pathWayNumber = pathWayNumber + 5 // position empty - 2,7,12,17,22 ...... like that
                }
                else
                {
                    seats.append(SeatModel(seatNumber: seatNumber, image: UIImage(named: "griKoltuk")!, isBooked: false, text: "\(seatNumber)", gender: 0, isSelected: false))
                    seatNumber = seatNumber + 1
                }
            }
        seatsCollectionView.dataSource = self
        seatsCollectionView.dataSource = self
        seatsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        selectedSeatsCollectionView.dataSource = self
        selectedSeatsCollectionView.delegate = self
        selectedSeatsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        
    }
    @objc func changeSeats(notification: NSNotification){
        self.isBooked = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPayScreenVC" {
            let destinationVC = segue.destination as! PayScreenVC
            destinationVC.busInformation = bus
            destinationVC.selectedSeats = selectedSeats
            destinationVC.cost = totalPrice
            destinationVC.delegate = self

        }else if segue.identifier == "goToError" {
            let destinationVC = segue.destination as! ErrorPopUpVC
            destinationVC.errorMode = errorMode
        }else if segue.identifier == "goToGenderSelectPopUpVC" {
            let destinationVC = segue.destination as! GenderSelectPopUp
            destinationVC.delegate = self
        }
    }
    
    @IBAction func continueButtonClicked(_ sender: UIButton) {
        if selectedSeats.count > 0 {
            self.performSegue(withIdentifier: "goToPayScreenVC", sender: self)
        }
        
    }
    @IBAction func backButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    //MARK: Functions
    func selectError(errorMode: Int){
        self.errorMode = errorMode
        self.performSegue(withIdentifier: "goToError", sender: self)
        
    }
    func bookTheSeats(){
        for seat in selectedSeats {
            seat.isBooked = true
            selectedSeats.removeAll()
            reloadView()
        }
    }
    func calculatePrice(){
        totalPrice = seatPrice * selectedSeatsNumber.count
        priceLabel.text = String("\(totalPrice) TL")
    }
    func changeImage(){
        switch gender {
        case 1:
            selectedCell?.seatImage.image = UIImage(named: "pembeKoltuk")
            seats[cellIndex].gender = 1
            seats[cellIndex].isSelected = true
            selectedSeatsNumber.append(seats[cellIndex].seatNumber)
            selectedSeats.append(seats[cellIndex])
        case 2:
            selectedCell?.seatImage.image = UIImage(named: "maviKoltuk")
            seats[cellIndex].gender = 2
            seats[cellIndex].isSelected = true
            selectedSeatsNumber.append(seats[cellIndex].seatNumber)
            selectedSeats.append(seats[cellIndex])
        default:
            return
        }
    }
    func reloadView(){
        selectedSeatsCollectionView.reloadData()
    }
    
}
//MARK: Extensions

extension SeatsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == seatsCollectionView{
        return 55
        }else{
            return selectedSeats.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == seatsCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeatCell", for: indexPath) as! SeatCell
            
        cell.alpha = 0 // Initially alpha 0
        let text = seats[indexPath.row].text

            if text == ""
            {
                cell.alpha = 0
                cell.isHidden = true
            }
            else
            {
                cell.isHidden = false
                cell.alpha = 1
            }
            for key in bus.soldSeats.keys{
                if text == key{
                    seats[indexPath.row].isBooked = true
                    seats[indexPath.row].gender = bus.soldSeats["\(text)"]!
                }
            }
            
        cell.configure(model: seats[indexPath.row])
        if seats[indexPath.row].isSelected {
            seats[indexPath.row].image = UIImage(named: "pembeKoltuk")!
        }
            return cell
        } else {
            let selectedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedSeatCell", for: indexPath) as! SelectedSeatCell
            selectedCell.selectedSeatNum.text = selectedSeats[indexPath.row].text
             
            if selectedSeats[indexPath.row].gender == 1 {
                selectedCell.selectedSeatImg.image = UIImage(named: "pembeKoltuk")
            } else {
                selectedCell.selectedSeatImg.image = UIImage(named: "maviKoltuk")
            }
            return selectedCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == seatsCollectionView {
            let bounds = seatsCollectionView.bounds
            return CGSize(width: bounds.width/14, height: bounds.width / 15)
        }else{
            let bounds = selectedSeatsCollectionView.bounds
            return CGSize(width: bounds.width/7, height: bounds.width / 5)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == seatsCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! SeatCell
            selectedCell = cell
            cellIndex = indexPath.row
            var selectedSeatSold = seats[cellIndex].isBooked
            
            switch selectedSeatSold{
            case false:
                
                if seats[indexPath.row].isSelected{
                    cell.seatImage.image = UIImage(named: "griKoltuk")
                    seats[cellIndex].isBooked = false
                    seats[cellIndex].gender = 0
                    seats[cellIndex].isSelected = false
                    selectedSeatsNumber = selectedSeatsNumber.filter {$0 != seats[cellIndex].seatNumber}
                    if let index = selectedSeats.firstIndex(where: { $0 === seats[cellIndex]}) {
                        selectedSeats.remove(at: index)
                    }
                    calculatePrice()
                    reloadView()
                }else {
                    if selectedSeats.count > 4 {
                        selectError(errorMode: 1)
                        print("en fazla 5 seç")
                    }else {
                        if selected == false {
                            selected = true
                            self.performSegue(withIdentifier: "goToGenderSelectPopUpVC", sender: self)
                            
                        }else{
                            selected = false
                        }
                    }
                }
               
            default:
                selectError(errorMode: 2)
                print("Koltuk satılmış")
        
            }
            print(seats[indexPath.row].seatNumber)
            
        }
    }
    
    
}
extension SeatsVC: SeatInfoDelegate {
    func sendBooking(isPayed: Bool, seatDict: [String : Int]) {
        self.isBooked = true
        if seatDict.count > 0 {
            print("checked")
            let busId = bus.id
            let dictForSend = ["soldSeats": seatDict ,"busId" : busId] as [String : Any]
            NotificationCenter.default.post(name: .sendDataNotification, object: nil, userInfo: dictForSend)
        }
    }

    
    
}

extension SeatsVC: GenderDelegate {
    func sendGender(gender: Int) {
        self.gender = gender
        
    }
    
    
}
