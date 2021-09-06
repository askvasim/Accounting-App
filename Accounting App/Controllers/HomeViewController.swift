//
//  ViewController.swift
//  Accounting App
//
//  Created by Vasim Khan on 9/2/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var amountLable: UILabel!
    @IBOutlet weak var transactionTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addButton(_ sender: UIButton) {
        
        let accountsStoryboard : UIStoryboard = UIStoryboard(name: "Accounts", bundle: nil)
        let transactionViewController = accountsStoryboard.instantiateViewController(withIdentifier: "TransactionViewControllerID") as! TransactionViewController
        
        navigationController?.pushViewController(transactionViewController, animated: true)
        
    }
    
}

