//
//  Payees.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 13/03/22.
//

import Foundation

// MARK: - PayeesResponse
struct PayeesResponse: Codable {
    let status: String?
    let data: [Payee]?
}

// MARK: - Datum
public struct Payee: Codable {
    let id, name, accountNo: String?
}
