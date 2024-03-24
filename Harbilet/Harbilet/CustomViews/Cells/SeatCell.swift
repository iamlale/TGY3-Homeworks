//
//  SeatCell.swift
//  Harbilet
//
//  Created by Lale Huseyin on 16.03.2024.
//

import UIKit

class SeatCell: UICollectionViewCell {
    
    @IBOutlet weak var seatNumberLabel: UILabel!
    @IBOutlet weak var seatImage: UIImageView!
    
    
    func configure(model: SeatModel) {
        self.seatNumberLabel.text = model.text
        self.seatImage.image = UIImage(named: selectImage(model: model))
    }
    
    func selectImage(model: SeatModel) -> String {
        if model.isBooked {
            if model.gender == 1 {
                return "pinkSeat"
            }else if model.gender == 2 {
                return "blueSeat"
            }else {
                return "greySeat"
            }
        } else {
            return "greySeat"
        }
    }
}
