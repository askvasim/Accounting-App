//
//  SecondViewVC.swift
//  Accounting App
//
//  Created by Vasim Khan on 9/2/21.
//

import UIKit

class TransactionViewController: UIViewController {
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    var transections: HomeNetworkProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func creditButton(_ sender: UIButton) {
        
        if let amountInput = amountTextField.text, !amountInput.isEmpty,
           let titleInput = titleTextField.text, !titleInput.isEmpty {
            
            transections.creditAmount(amount: amountInput, title: titleInput) { creditAmount in
                let alertController = UIAlertController(title: "Record Added", message: creditAmount, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
        } else {
            // Show Message
            let alertController = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func debitButton(_ sender: UIButton) {
        
        if let amountInput = amountTextField.text, !amountInput.isEmpty,
           let titleInput = titleTextField.text, !titleInput.isEmpty {
            
            transections.debitAmount(amount: amountInput, title: titleInput) { debitAmount in
                    let alertController = UIAlertController(title: "Record Added", message: debitAmount, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alertController, animated: true, completion: nil)
            }
        } else {
            // Show Message
            let alertController = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
