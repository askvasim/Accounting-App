//
//  TransactionData.swift
//  Accounting App
//
//  Created by Vasim Khan on 9/11/21.
//

import Foundation

struct TransactionData: Codable {
    let transactions: [Transaction]
}

struct Transaction: Codable {
    let amount: Int
    let transactionAmount: Int
    let type: TypeEnum
    let title: String
    let time: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case amount
        case transactionAmount
        case type
        case title
        case time
        case id = "_id"
    }
}

enum TypeEnum: String, Codable {
    case credit = "credit"
    case debit = "debit"
}

