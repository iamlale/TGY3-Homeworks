//
//  BusModel.swift
//  Harbilet
//
//  Created by Lale Huseyin on 15.03.2024.
//

import UIKit

struct BusModel {
    var cityFrom: String
    var cityTo: String
    var date: String
    var time: String
    var price: Int
    var soldSeats: [String : Int]
    let id: Int
    let companyName: String
    let companyImg: UIImage
}
