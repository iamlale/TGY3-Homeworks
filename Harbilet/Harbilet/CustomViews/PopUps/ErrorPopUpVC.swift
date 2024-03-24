//
//  ErrorPopUpVC.swift
//  Harbilet
//
//  Created by Lale Huseyin on 19.03.2024.
//

import UIKit

class ErrorPopUpVC: UIViewController {
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    var errorMessages = [ErrorModel]()
    var errorMode = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        let msg1 = ErrorModel(message: "Seçtiğiniz sefer bulunmamaktadır!")
        let msg2 = ErrorModel(message: "En fazla 5 koltuk seçebilirsiniz!")
        let msg3 = ErrorModel(message: "Seçtiğiniz koltuk satıldı!")
        let msg4 = ErrorModel(message: "Lütfen bilgilerinizi kontrol ederek tekrar yazınız!.")
        errorMessages.append(msg1)
        errorMessages.append(msg2)
        errorMessages.append(msg3)
        errorMessages.append(msg4)
        
        



    }
    override func viewWillAppear(_ animated: Bool) {
        showError()
    }
    override func viewDidDisappear(_ animated: Bool) {
        errorMode = -1
    }
    func showError(){
        switch errorMode{
        case 0:
            errorMessageLabel.text = errorMessages[errorMode].message
        case 1:
            errorMessageLabel.text = errorMessages[errorMode].message
        case 2:
            errorMessageLabel.text = errorMessages[errorMode].message
        default:
            errorMessageLabel.text = errorMessages[errorMode].message
        }
        
    }
    
    @IBAction func okayButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
