//
//  Receiver.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 12/03/22.
//

import Foundation

// MARK: - Receiver
struct ReceiverResponse: Codable {
    let status: String?
    let data: [Receiver]?
}

// MARK: - Datum
public struct Receiver: Codable {
    let id, name, accountNo: String?
}

