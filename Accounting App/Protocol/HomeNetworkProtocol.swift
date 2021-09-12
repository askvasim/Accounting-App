//
//  NetworkProtocal.swift
//  Accounting App
//
//  Created by Vasim Khan on 9/9/21.
//

import Foundation

protocol HomeNetworkProtocol {
    func getBalance(onCompliteion: @escaping (_ accountBalance: Int) -> ())
    func getTransaction(onCompliteion: @escaping (_ transactionData: [Transaction])-> ())
    
    func creditAmount(amount: String, title: String, onComplition: @escaping (_ message: String) -> ())
    
    func debitAmount(amount: String, title: String, onCompletion: @escaping (_ message: String) -> ())
}

//protocol TransactionNetworkProtocol {
//    
//}

//protocol transactionNetworkProtocol {
//    func getTransaction(onCompliteion: @escaping (_ amount: Int, _ transactionAmount: Int, _ type: String, _ title: String, _ time: String, _ trsansectionId: String)-> ())
//}
