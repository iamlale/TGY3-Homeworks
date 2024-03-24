//
//  OnboardingCell.swift
//  Harbilet
//
//  Created by Lale Huseyin on 20.03.2024.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = UIImage(named: slide.image)
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
