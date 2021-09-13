//
//  NetworkHandler.swift
//  Accounting App
//
//  Created by Vasim Khan on 9/9/21.
//

import Foundation

class HomeNetworkHandler: HomeNetworkProtocol {
    
    func getBalance(onCompliteion: @escaping (_ accountBalance: Int) -> ()) {
        
        let balanceAPIPath = "http://3.109.156.252:3001/api/balance"
        
        if let balanceAPIURL = URL(string: balanceAPIPath) {
            
            var request = URLRequest(url: balanceAPIURL)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpMethod = "GET"
            request.setValue("8918623815", forHTTPHeaderField: "Authorization")
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    do {
                        let decodedData = try JSONDecoder().decode(AccountBalance.self, from: safeData)
                        let amount = decodedData.balance
                        onCompliteion(amount)
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    func getTransaction(onCompliteion: @escaping ([Transaction]) -> ()) {
        let transactionAPIPath = "http://3.109.156.252:3001/api/transactions"
        
        if let transactionAPIURL = URL(string: transactionAPIPath) {
            
            var request = URLRequest(url: transactionAPIURL)
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpMethod = "GET"
            request.setValue("8918623815", forHTTPHeaderField: "Authorization")
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    do {
                        let decodedData = try JSONDecoder().decode(TransactionData.self, from: safeData)
                        
                        let amount = decodedData.transactions
                        
                        onCompliteion(amount)
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
    func creditAmount(amount: String, title: String, onComplition: @escaping (String) -> ()) {
        let creditAPIPath = "http://3.109.156.252:3001/api/credit"
        
        if let creditAPIURL = URL(string: creditAPIPath) {
            
            var request = URLRequest(url: creditAPIURL)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("8918623815", forHTTPHeaderField: "Authorization")
            
            let userInput = ["amount": amount, "title": title]
            do {
                let requestData = try JSONSerialization.data(withJSONObject: userInput, options: [])
                let session = URLSession(configuration: .default)
                session.uploadTask(with: request, from: requestData) { data, response, error in
                    if error != nil {
                        print(error!)
                        return
                    }
                    if let safeData = data {
                        do {
                            let decodedData = try JSONDecoder().decode(TransactionResponse.self, from: safeData)
                            let message = decodedData.message
                            onComplition(message)
                        } catch {
                            print(error)
                        }
                    }
                }.resume()
                
            } catch let error {
                print(error)
            }
        }
    }
    
    func debitAmount(amount: String, title: String, onCompletion: @escaping (String) -> ()) {
        let debitAPIPath = "http://3.109.156.252:3001/api/debit"
        
        if let debitAPIURL = URL(string: debitAPIPath) {
            
            var request = URLRequest(url: debitAPIURL)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("8918623815", forHTTPHeaderField: "Authorization")
            
            let userInput = ["amount": amount, "title": title]
            do {
                let requestedData = try JSONSerialization.data(withJSONObject: userInput, options: [])
                let session = URLSession(configuration: .default)
                session.uploadTask(with: request, from: requestedData) { data, response, error in
                    if error != nil {
                        print(error!)
                        return
                    }
                    if let safeData = data {
                        do {
                            let decodedData = try JSONDecoder().decode(TransactionResponse.self, from: safeData)
                            let message = decodedData.message
                            onCompletion(message)
                        } catch {
                            print(error)
                        }
                    }
                }.resume()
                
            } catch let error {
                print(error)
            }
        }
    }
}

