//
//  SeatModel.swift
//  Harbilet
//
//  Created by Lale Huseyin on 15.03.2024.
//

import Foundation

import UIKit

class SeatModel {
    var seatNumber: Int
    var image: UIImage
    var isBooked: Bool
    var text: String
    var gender: Int = 0 // 0 - empty,  1 - woman, 2 - man
    var isSelected: Bool
    
    init( seatNumber: Int, image: UIImage, isBooked: Bool, text: String, gender: Int, isSelected: Bool) {
        self.seatNumber = seatNumber
        self.image = image
        self.isBooked = isBooked
        self.text = text
        self.gender = gender
        self.isSelected = isSelected
    }
    
}
