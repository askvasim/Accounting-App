//
//  ViewController.swift
//  Accounting App
//
//  Created by Vasim Khan on 9/2/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeNetworkProtocol: HomeNetworkProtocol!
    var transactions: [Transaction]?
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var transactionTableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        homeNetworkProtocol.getBalance(onCompliteion: { amount in
            DispatchQueue.main.async {
                self.amountLabel.text = "₹ \(amount)"
            }
        })
        
        homeNetworkProtocol.getTransaction { transactions in
            self.transactions = transactions
            DispatchQueue.main.async {
                self.transactionTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
        transactionTableView.register(UINib(nibName: "TransactionTableViewCell", bundle: nil), forCellReuseIdentifier: "CellIdentifier")
        
        //        homeNetworkProtocol.getBalance(onCompliteion: { amount in
        //            DispatchQueue.main.async {
        //                self.amountLabel.text = "₹ \(amount)"
        //            }
        //        })
        //
        //        homeNetworkProtocol.getTransaction { transactions in
        //            self.transactions = transactions
        //            DispatchQueue.main.async {
        //                self.transactionTableView.reloadData()
        //            }
        //        }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let accountsStoryboard : UIStoryboard = UIStoryboard(name: "Accounts", bundle: nil)
        let transactionViewController = accountsStoryboard.instantiateViewController(withIdentifier: "TransactionViewControllerID") as! TransactionViewController
        
        navigationController?.pushViewController(transactionViewController, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! TransactionTableViewCell
        cell.titleLabel.text = transactions?[indexPath.row].title
        cell.idLabel.text = transactions?[indexPath.row].id
        cell.timeLabel.text = transactions?[indexPath.row].time
        cell.balanceLabel.text = " Balance: ₹ \(transactions?[indexPath.row].amount ?? 0)"
        cell.transactionAmountLabel.text = "₹ \(transactions?[indexPath.row].transactionAmount ?? 0)"
        
        let credit = "credit"
        
        switch credit {
        case transactions?[indexPath.row].type.rawValue:
            cell.cellBackgroundView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        default:
            cell.cellBackgroundView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.5868732374, blue: 0.5450980663, alpha: 1)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
