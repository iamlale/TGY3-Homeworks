//
//  TicketCell.swift
//  Harbilet
//
//  Created by Lale Huseyin on 16.03.2024.
//

import UIKit

class TicketCell: UICollectionViewCell {
    
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    
    func configure (model: TicketModel) {
        self.costLabel.text = String("\(model.cost) TL")
        self.timeLabel.text = model.bus?.time
        self.dateLabel.text = model.bus?.date
        self.toLabel.text = model.bus?.cityTo
        self.fromLabel.text = model.bus?.cityFrom
    }
}
