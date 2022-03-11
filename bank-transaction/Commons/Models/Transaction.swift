//
//  Transaction.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.
//

import Foundation

// MARK: - Transaction
struct TransactionResponse: Codable {
    let status: String?
    let data: [Transaction]?
}

// MARK: - Datum
struct Transaction: Codable {
    let transactionID: String?
    let amount: Double?
    let transactionDate: String?
    let datumDescription: String?
    let transactionType: TransactionType?
    let receipient: Receipient?

    enum CodingKeys: String, CodingKey {
        case transactionID = "transactionId"
        case amount, transactionDate
        case datumDescription = "description"
        case transactionType, receipient
    }
}

// MARK: - Receipient
struct Receipient: Codable {
    let accountNo, accountHolder: String?
}

enum TransactionType: String, Codable {
    case transfer = "transfer"
}
