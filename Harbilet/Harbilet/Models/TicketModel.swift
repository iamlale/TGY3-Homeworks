//
//  TicketModel.swift
//  Harbilet
//
//  Created by Lale Huseyin on 15.03.2024.
//

import Foundation

struct TicketModel{
    var passenger: Passenger?
    var numberOfSeats: Int?
    var seat: [SeatModel]?
    var bus: BusModel?
    var cost = 0
    
}
