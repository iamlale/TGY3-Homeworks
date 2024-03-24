//
//  SelectedSeatCell.swift
//  Harbilet
//
//  Created by Lale Huseyin on 16.03.2024.
//

import UIKit

class SelectedSeatCell: UICollectionViewCell {
    @IBOutlet weak var selectedSeatImg: UIImageView!
    @IBOutlet weak var selectedSeatNum: UILabel!
    func configure(model: SeatModel?){
        guard let input = model?.image else {return}
        self.selectedSeatNum.text = model?.text
        self.selectedSeatImg.image = model?.image ?? input
    }
    func selectImage(model: SeatModel) -> String {
        if model.isSelected {
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
