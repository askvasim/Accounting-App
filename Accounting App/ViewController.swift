//
//  ViewController.swift
//  Accounting App
//
//  Created by Vasim Khan on 9/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var transactionTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButton(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondView = storyBoard.instantiateViewController(withIdentifier: "SecondViewID") as! SecondViewVC
        
        secondView.modalPresentationStyle = .fullScreen
        self.present(secondView, animated: true, completion: nil)
        
    }
    
}

