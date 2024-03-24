//
//  GenderSelectPopUp.swift
//  Harbilet
//
//  Created by Lale Huseyin on 18.03.2024.
//

import UIKit

protocol GenderDelegate {
    func sendGender(gender: Int)
}

class GenderSelectPopUp: UIViewController {
    
    var delegate: GenderDelegate?
    var gender = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    

    @IBAction func womanButtonClicked(_ sender: UIButton) {
        gender = 1
        self.delegate?.sendGender(gender: 1)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func manButtonClicked(_ sender: UIButton) {
        gender = 2
        self.delegate?.sendGender(gender: 2)
        dismiss(animated: true, completion: nil)
    }
}
