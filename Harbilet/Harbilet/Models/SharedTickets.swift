//
//  SharedTickets.swift
//  Harbilet
//
//  Created by Lale Huseyin on 15.03.2024.
//

import Foundation

class SharedTickets {
    static let sharedIntance = SharedTickets()
    static var bookedTickets = [TicketModel]()
}
