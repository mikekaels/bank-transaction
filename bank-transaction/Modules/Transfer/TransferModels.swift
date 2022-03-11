//
//  TransferModels.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

import UIKit

import Foundation

// MARK: - Receiver
struct Transfer: Codable {
    let status, transactionID: String?
    let amount: Double?
    let receiverDescription, recipientAccount: String?

    enum CodingKeys: String, CodingKey {
        case status
        case transactionID = "transactionId"
        case amount
        case receiverDescription = "description"
        case recipientAccount
    }
}
