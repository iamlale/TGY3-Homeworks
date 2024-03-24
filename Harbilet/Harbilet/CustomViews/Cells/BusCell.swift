//
//  BusCell.swift
//  Harbilet
//
//  Created by Lale Huseyin on 16.03.2024.
//

import UIKit

class BusCell: UICollectionViewCell {
    @IBOutlet weak var busImage: UIImageView!
    @IBOutlet weak var busTime: UILabel!
    @IBOutlet weak var busPrice: UILabel!
    
    func configure (model: BusModel) {
        self.busTime.text = model.time
        self.busPrice.text = "\(String(model.price)).00 TL"
        self.busImage.image = model.companyImg
    }
}
