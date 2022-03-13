//
//  Transfer.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 13/03/22.
//

import Foundation

struct Transfer: Codable {
    let status, transactionID: String?
    let amount: Float?
    let transferDescription, recipientAccount: String?

    enum CodingKeys: String, CodingKey {
        case status
        case transactionID = "transactionId"
        case amount
        case transferDescription = "description"
        case recipientAccount
    }
}
